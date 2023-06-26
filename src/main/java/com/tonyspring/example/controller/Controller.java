package com.tonyspring.example.controller;

import java.security.Principal;
import java.util.List;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonyspring.example.domain.Board;
import com.tonyspring.example.domain.User;
import com.tonyspring.example.service.BoardService;
import com.tonyspring.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	BoardService boardservice;
	@Autowired
	UserService userservice;
	@Autowired
	PasswordEncoder encoder;

	@RequestMapping("/")
	public String home(Model model, Principal principal) {
		// Authentication authentication = (Authentication) principal;
		// UserDetails user = (User) authentication.getPrincipal();
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
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

	@Secured({ "ROLE_USER" })
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
	
	@RequestMapping(value = "/board/before-create")
	public String boardBeforeCreate(Model model, Principal principal) {
		Authentication authentication = (Authentication) principal;
		UserDetails user = (User) authentication.getPrincipal();
		model.addAttribute("user", user);
		return "/board/board_before_create";
	}
	
	@RequestMapping(value="/board/create")
	public String CreateBoard(Model model, Board board) {
		boardservice.createBoard(board);
		boardservice.updateBoard(board);
		home(model, null);
		return "/index";
	}
	
	@RequestMapping(value="/board/detail")
	public String detailBoard(@RequestParam String bId, Model model, Board board) {
		board.setbId(Integer.parseInt(bId)); 
		Board board1 = boardservice.getBoard(board);
		model.addAttribute("board",board1);
		return "/board/board_detail";
	}
	
	@RequestMapping(value="/board/before-edit")
	public String beforeEditBoard(@RequestParam String bId, Model model, Board board) {
		board.setbId(Integer.parseInt(bId));
		Board board1 = boardservice.getBoard(board);
		model.addAttribute("board",board1);
		return "/board/board_edit";
	}
	
	
	@RequestMapping(value = "/board/edit")
	public String editBoard(@RequestParam String bId, Board board, Model model) {
		board.setbId(Integer.parseInt(bId));
		boardservice.editBoard(board);
		detailBoard(bId, model, board);
		return "/board/board_detail";
	}
	 
	@RequestMapping(value = "/board/delete")
	public String deleteBoard(Board board, Model model) {
		board.setbId(board.getbId());
		boardservice.deleteBoard(board);
		home(model, null);
		return "/index";
	}
	
	@RequestMapping(value = "/board/beforeRecreate") 
	public String beforeRecreateBoard(Board board, Principal principal, Model model) {
		Authentication authentication = (Authentication) principal;
		UserDetails user = (User) authentication.getPrincipal();
		Board board1 = boardservice.getBoard(board);
		model.addAttribute("user",user);
		model.addAttribute("board",board1);
		return "/board/before-recreate";
	}
	
	@RequestMapping(value = "/board/recreate")
	public String recreateBoard(Board board, Model model) {
		boardservice.createReboard(board);
		boardservice.updateReboard(board);
		home(model, null);
		return "/index";
	}
	
}







