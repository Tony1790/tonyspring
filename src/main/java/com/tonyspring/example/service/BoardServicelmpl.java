package com.tonyspring.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tonyspring.example.domain.Board;
import com.tonyspring.example.domain.Pagination;
import com.tonyspring.example.domain.Search;
import com.tonyspring.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServicelmpl implements BoardService {
	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return boardmapper.selectBoardList(pagination);
	}
	
	@Override
	public void createBoard(Board board) {
		boardmapper.createBoard(board);
		boardmapper.updateBoard(board);
	}
	
	
	@Override
	public Board getBoard(Board board) {
		return boardmapper.getBoard(board);
	}
	
	@Override
	public void editBoard(Board board) {
		boardmapper.editBoard(board);
	}
	
	@Override
	public void deleteBoard(Board board) {
		boardmapper.deleteBoard(board);
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
