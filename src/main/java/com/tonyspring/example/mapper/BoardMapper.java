package com.tonyspring.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.tonyspring.example.domain.Board;
import com.tonyspring.example.domain.Pagination;
import com.tonyspring.example.domain.Search;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList(Pagination pagination);
	
	public void createBoard(Board board);
	
	public void updateBoard(Board board);
	
	public Board getBoardJustMade();
	
	public Board getBoard(Board board);
	
	public void editBoard(Board board);
	
	public void deleteBoard(Board board);
	
	public void createReboard(Board board);
	
	public void updateReboard(Board board);
	
	public List<Board> searchBoard(Search search);
	
	public int countBoards();
	
}
