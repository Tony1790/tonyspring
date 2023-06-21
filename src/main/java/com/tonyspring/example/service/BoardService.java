package com.tonyspring.example.service;

import java.util.List;
import com.tonyspring.example.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList();
	
	public void createBoard(Board board);
	
	public Board getBoard(Board board);
}
