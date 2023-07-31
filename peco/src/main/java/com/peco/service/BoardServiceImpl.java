package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.peco.mapper.BoardMapper;
import com.peco.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;
	
	@Override
	public List<BoardVO> getMain() {
	
		return mapper.getMain();

	}

	@Override
	public List<BoardVO> getList(String category) {
		
		return mapper.getList(category);
	}
	
	@Override
	public BoardVO selectOne(int bno) {
		return mapper.selectOne(bno);
	}

	@Override
	public List<BoardVO> getFree() {
	
		return mapper.getFree();
	}

	@Override
	public List<BoardVO> getHealing() {

		return mapper.getHealing();
	}

	@Override
	public int delete(int bno) {

		return mapper.delete(bno);
	}

	@Override
	public int insertSelectKey(BoardVO boardvo) {

		return mapper.insertSelectKey(boardvo);
	}

	
}
