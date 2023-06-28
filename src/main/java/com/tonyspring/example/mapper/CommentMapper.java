package com.tonyspring.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tonyspring.example.domain.Comment;

@Mapper
public interface CommentMapper {
	public void createComment(Comment comment);
	public void updateComment(Comment comment);
	public List<Comment> readComments(Comment comment);
	public Comment readComment(Comment comment);
	public void deleteComment(Comment comment);
	public void createRecomment(Comment comment);
	public void updateRecomment(Comment comment);
}
