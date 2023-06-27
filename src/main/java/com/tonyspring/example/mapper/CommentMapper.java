package com.tonyspring.example.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.tonyspring.example.domain.Comment;

@Mapper
public interface CommentMapper {
	public void createComment(Comment comment);
	public void updateComment(Comment comment);
}
