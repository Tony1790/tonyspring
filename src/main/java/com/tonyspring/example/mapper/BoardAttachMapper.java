package com.tonyspring.example.mapper;

import java.util.List;

import com.tonyspring.example.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBid(int b_id);
}
