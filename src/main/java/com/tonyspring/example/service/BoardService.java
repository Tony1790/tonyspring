package com.tonyspring.example.service;

import java.util.List;
import com.tonyspring.example.domain.Board;
import com.tonyspring.example.domain.Pagination;
import com.tonyspring.example.domain.Search;

public interface BoardService {
	public List<Board> selectBoardList(Pagination pagination);
	
	public void createBoard(Board board);
	
	public Board getBoard(Board board);
	
	public void editBoard(Board board);
	
	public void deleteBoard(Board board);
	
	public void createReboard(Board board);
	
	public List<Board> searchBoard(Search search);
	
	public int countBoards();
	
}
