package com.tonyspring.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.tonyspring.example.domain.Board;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList();
	
	public void createBoard(Board board);
	
	public Board getBoard(Board board);
}
