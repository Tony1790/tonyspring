package com.tonyspring.example.service;

import java.util.List;
import com.tonyspring.example.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList();
	
	public void createBoard(Board board);
	
	public void updateBoard(Board board);
	
	public Board getBoard(Board board);
	
	public void editBoard(Board board);
	
	public void deleteBoard(Board board);
	
	public void createReboard(Board board);
	
	public void updateReboard(Board board);
}
