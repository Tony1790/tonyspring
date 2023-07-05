package com.tonyspring.example.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tonyspring.example.domain.*;
import com.tonyspring.example.service.*;
import com.tonyspring.example.util.*;

import lombok.*;
import net.coobird.thumbnailator.Thumbnailator;

@org.springframework.stereotype.Controller
public class Controller {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	BoardService boardservice;
	@Autowired
	UserService userservice;
	@Autowired
	CommentService commentservice;
	@Autowired
	PasswordEncoder encoder;
	
	int page = 1;

	@RequestMapping("/")
	public String home(Model model, Pagination pagination) {
		// Authentication authentication = (Authentication) principal;
		// UserDetails user = (User) authentication.getPrincipal();
		
		if(pagination.getPage() != 0) {
			page = pagination.getPage();			
		}
		pagination.setPage(page);
		pagination.setCount(boardservice.countBoards());
		pagination.init();
		List<Board> list = boardservice.selectBoardList(pagination);
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		return "/index";
	}

	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}

	@RequestMapping("/signup")
	public String signup(User user) {
		// 비밀번호 암호화
		String encodedPassword = encoder.encode(user.getPassword());

		// 유저 데이터 세팅
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		// 유저 생성
		userservice.createUser(user);
		// 유저 권한 생성
		userservice.createAuthorities(user);

		return "/login";
	}

	@RequestMapping(value = "/login")
	public String beforeLogin(Model model) {
		return "/login";
	}

	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/admin")
	public String admin(Model model) {
		return "/admin";
	}

	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/user/list")
	public String userList(Model model) {
		List<User> userList = userservice.selectUserList();
		model.addAttribute("userList",userList);
		return "/user_list";
	}

	@Secured({ "ROLE_USER" , "ROLE_ADMIN"})
	@RequestMapping(value = "/user/info")
	public String userInfo(Model model) {
		return "/user_info";
	}
	
	
	@RequestMapping(value = "/user/detail")
	public String userDetail(@RequestParam String username, Model model) {
		User user = userservice.readUser(username);
		model.addAttribute("user", user);
		return "/user_detail";
	}

	@RequestMapping(value="/user/before_edit")
	public String userBeforeEdit(@RequestParam String username, Model model) {
		User user = userservice.readUser(username);
		model.addAttribute("user", user);
		return "/before_edit";
	}
	
	@RequestMapping(value="/user/edit")
	public String userEdit(User user) {
		// 비밀번호 암호화
		String encodedPassword = encoder.encode(user.getPassword());
		
		// 유저 생성
		user.setPassword(encodedPassword);
		user.setUsername(user.getUsername());
		user.setuName(user.getuName());
		
		//유저 정보 수정
		userservice.editUser(user);
		return "/user_info";
	}
	
	@RequestMapping(value="/user/delete")
	public String deleteUser(User user) {
		user.setUsername(user.getUsername());
		userservice.deleteUser(user);
		return "/user_delete";
	}
	
	@RequestMapping(value = "/denied")
	public String denied(Model model) {
		return "/denied";
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/board/before-create")
	public String boardBeforeCreate(Model model, Principal principal) {
		Authentication authentication = (Authentication) principal;
		UserDetails user = (User) authentication.getPrincipal();
		model.addAttribute("user", user);
		return "/board/board_before_create";
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value="/board/create")
	public String CreateBoard(Model model, Board board, Pagination pagination) {
		boardservice.createBoard(board);
		home(model, pagination);
		return "/index";
	}
	
	@RequestMapping(value="/board/detail")
	public String detailBoard(Model model, Board board, Comment comment) {
		//board.setbId(Integer.parseInt(bId)); 
		Board board1 = boardservice.getBoard(board);
		comment.setB_id(board.getbId());
		List<Comment> commentList = commentservice.readComments(comment);
		model.addAttribute("commentList",commentList);
		model.addAttribute("board",board1);
		return "/board/board_detail";
	}
	
	@PreAuthorize("@checker.isWriter(#principal, #board)")
	@RequestMapping(value="/board/before-edit")
	public String beforeEditBoard(Model model, Board board, Principal principal) {
		Board board1 = boardservice.getBoard(board);
		model.addAttribute("board",board1);
		return "/board/board_edit";
	}
	
	@PreAuthorize("@checker.isWriter(#principal, #board)")
	@RequestMapping(value = "/board/edit")
	public String editBoard(Board board, Model model, Comment comment, Principal principal) {
		boardservice.editBoard(board);
		detailBoard(model, board, comment);
		return "/board/board_detail";
	}
	
	@PreAuthorize("hasRole('ROLE_USER') and @checker.isWriter(#principal, #board) or hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/board/delete")
	public String deleteBoard(Board board, Model model,Pagination pagination) {
		boardservice.deleteBoard(board);
		home(model, pagination);
		return "/index";
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/board/beforeRecreate") 
	public String beforeRecreateBoard(Board board, Principal principal, Model model) {
		Authentication authentication = (Authentication) principal;
		UserDetails user = (User) authentication.getPrincipal();
		Board board1 = boardservice.getBoard(board);
		model.addAttribute("user",user);
		model.addAttribute("board",board1);
		return "/board/before-recreate";
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/board/recreate")
	public String recreateBoard(Board board, Model model) {
		boardservice.createReboard(board);
		home(model, null);
		return "/index";
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/comment/create")
	public String createComment(Model model ,Comment comment, Principal principal) {
		Authentication authentication = (Authentication) principal;
		UserDetails user = (User) authentication.getPrincipal();
		comment.setC_writer(user.getUsername());
		commentservice.createComment(comment);
		List<Comment> commentList = commentservice.readComments(comment);
		model.addAttribute("commentList",commentList);
		return "/comment/comment-list";
		//return으로 jsp조각에 comment를 쏴주고, 그 jsp조각을 detail파일에 ajax로 쏴야함.
		//responsebody는 쓸 필요가 없다.
	}
	
	@ResponseBody
	@RequestMapping(value="/recomment/edit")
	public Comment recommentEdit(Comment comment, Model model) {
		Comment comment1 = commentservice.readComment(comment);
		//model.addAttribute("comment1", comment1);
		return comment1;
	}
	
	@PreAuthorize("hasRole('ROLE_USER') and @checker.isCommentWriter(#principal, #comment) or hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/recomment/delete")
	public String recommentDelete(Comment comment, Model model, Principal principal) {
		commentservice.deleteComment(comment);
		List<Comment> commentList = commentservice.readComments(comment);
		model.addAttribute("commentList",commentList);
		return "/comment/comment-list";
	}
	
	@Secured({ "ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value="/recomment/create")
	public String recommentCreate(Comment comment, Model model, Principal principal) {
		Comment comment1 = commentservice.readComment(comment);
		Authentication authentication = (Authentication) principal;
		UserDetails user = (User) authentication.getPrincipal();
		comment1.setC_writer(user.getUsername());
		comment1.setC_content(comment.getC_content());
		commentservice.createRecomment(comment1);
		List<Comment> commentList = commentservice.readComments(comment1);
		model.addAttribute("commentList",commentList);
		return "/comment/comment-list";
	}
	
	@PreAuthorize("@checker.isCommentWriter(#principal, #comment)")
	@RequestMapping(value = "/comment/edit")
	public String commentEdit(Comment comment, Model model, Principal principal) {
		Comment comment1 = commentservice.editComment(comment);
		List<Comment> commentList = commentservice.readComments(comment1);
		model.addAttribute("commentList",commentList);
		return "/comment/comment-list";
	}
	
	@RequestMapping(value = "/search")
	public String search(Search search, Model model) {
		List<Board> list = boardservice.searchBoard(search);
		model.addAttribute("list", list);
		return "/index";
	}
	
	@RequestMapping("/uploadAjax")
	public void uploadAjax() {
		logger.info("upload ajax");
	}
	
	//오늘 날짜의 경로를 문자열로 생성.
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);

	}
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<AttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();

		//make Folder--------------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		//해당 경로가 있는지 검사 후, 없으면 폴더를 생성함
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//make yyyy/MM/dd 폴더
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachFileDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			logger.info("only file name : " + uploadFileName);
			attachFileDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachFileDTO.setUuid(uuid.toString());
				attachFileDTO.setUploadPath(uploadFolderPath);
				
				// Check if the file is an image type
				if (checkImageType(saveFile)) {
					attachFileDTO.setImage(true);
					try (FileInputStream fis = new FileInputStream(saveFile);
							FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName))) {
						Thumbnailator.createThumbnail(fis, thumbnail, 100, 100);
					}
				}
				
				//리스트에 다 더하기
				list.add(attachFileDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e.getMessage());
			} //end catch
		}//end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	//업로드된 파일이 이미지 종류의 파일인지 확인
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		} catch(IOException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}







