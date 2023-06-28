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
}
