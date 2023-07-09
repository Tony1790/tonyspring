package com.tonyspring.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tonyspring.example.domain.BoardAttachVO;

@Mapper
public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBid(int b_id);
	
	public void deleteAll(int b_id);
}
