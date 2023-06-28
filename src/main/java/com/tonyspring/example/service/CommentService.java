package com.tonyspring.example.service;

import java.util.List;

import com.tonyspring.example.domain.Comment;

public interface CommentService {
	public void createComment(Comment comment);
	
	public List<Comment> readComments(Comment comment);
	
	public Comment readComment(Comment comment);
	
	public void deleteComment(Comment comment);
	
	public void createRecomment(Comment comment);
}
