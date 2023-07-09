package com.tonyspring.example.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tonyspring.example.domain.Board;
import com.tonyspring.example.domain.BoardAttachVO;
import com.tonyspring.example.domain.Pagination;
import com.tonyspring.example.domain.Search;
import com.tonyspring.example.mapper.BoardAttachMapper;
import com.tonyspring.example.mapper.BoardMapper;
import lombok.*;

@Service("BoardServiceImpl")
public class BoardServicelmpl implements BoardService {
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardMapper boardmapper;
	@Autowired BoardAttachMapper boardAttachMapper;
	
	private BoardMapper mapper;
	private BoardAttachMapper attachMapper;
	
	@Autowired
	public void setAttachMapper(BoardAttachMapper attachMapper) {
		this.attachMapper = attachMapper;
	}

	@Autowired
	public void setMapper(BoardMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return boardmapper.selectBoardList(pagination);
	}
	
	@Transactional
	@Override
	public void createBoard(Board board) {
		log.info("create........" + board.toString());
		
		boardmapper.createBoard(board);
		boardmapper.updateBoard(board);
		Board board1 = boardmapper.getBoardJustMade();
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setB_id(board1.getbId());
			attachMapper.insert(attach);
		});
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(int b_id) {
		log.info("get Attach list by b_id: " + b_id);
		return attachMapper.findByBid(b_id);
	}
	
	
	@Override
	public Board getBoard(Board board) {
		return boardmapper.getBoard(board);
	}
	
	@Override
	public void editBoard(Board board) {
		boardmapper.editBoard(board);
	}
	
	@Transactional
	@Override
	public void deleteBoard(Board board) {
		log.info("delete......" + board.getbId());
		attachMapper.deleteAll(board.getbId());
		boardmapper.deleteBoard(board);
		log.info("Delete is success!");
	}
	
	@Override
	public void createReboard(Board board) {
		boardmapper.createReboard(board);
		boardmapper.updateReboard(board);
	}
	
	@Override
	public List<Board> searchBoard(Search search) {
		return boardmapper.searchBoard(search);
	}
	
	@Override
	public int countBoards() {
		return boardmapper.countBoards();
	}

}
