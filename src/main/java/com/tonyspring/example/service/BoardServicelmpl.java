package com.tonyspring.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tonyspring.example.domain.Board;
import com.tonyspring.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServicelmpl implements BoardService {
	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList() {
		return boardmapper.selectBoardList();
	}
}
