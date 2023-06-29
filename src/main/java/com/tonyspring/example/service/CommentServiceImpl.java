package com.tonyspring.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tonyspring.example.domain.Comment;
import com.tonyspring.example.mapper.CommentMapper;

@Service("CommentServiceImpl")
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentMapper commentMapper;
	
	@Override
	public void createComment(Comment comment) {
		commentMapper.createComment(comment);
		commentMapper.updateComment(comment);
	}
	
	@Override
	public List<Comment> readComments(Comment comment) {
		return commentMapper.readComments(comment);
	}
	
	@Override
	public Comment readComment(Comment comment) {
		return commentMapper.readComment(comment);
	}
	
	@Override
	public void deleteComment(Comment comment) {
		commentMapper.deleteComment(comment);
	}
	
	@Override
	public void createRecomment(Comment comment) {
		commentMapper.createRecomment(comment);
		commentMapper.updateRecomment(comment);
	}
	
	@Override
	public Comment editComment(Comment comment) {
		commentMapper.editComment(comment);
		return commentMapper.readComment(comment);
	}
}
