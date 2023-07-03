package com.tonyspring.example.util;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.tonyspring.example.domain.Board;
import com.tonyspring.example.domain.Comment;
import com.tonyspring.example.domain.User;
import com.tonyspring.example.service.BoardService;
import com.tonyspring.example.service.CommentService;

@Component
public class Checker {
	
	@Autowired
	BoardService boardservice;
	@Autowired
	CommentService commentservice;
	
	
	public boolean isWriter(Authentication principal, Board board) {
	    UserDetails user = (User) principal.getPrincipal();
	    board = boardservice.getBoard(board);
	    if(user.getUsername().equals(board.getbWriter())) {
	        return true;
	    } else {
	        return false;
	    }
	}
	
	public boolean isCommentWriter(Authentication principal, Comment comment) {
	    UserDetails user = (User) principal.getPrincipal();
	    comment = commentservice.readComment(comment);
	    if(user.getUsername().equals(comment.getC_writer())) {
	        return true;
	    } else {
	        return false;
	    }
	}
}
