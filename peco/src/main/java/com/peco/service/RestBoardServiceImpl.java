package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.BoardMapper;
import com.peco.mapper.RestBoardMapper;
import com.peco.vo.BoardVO;

@Service
public class RestBoardServiceImpl implements RestBoardService {


	@Autowired
	RestBoardMapper mapper;
	
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
	public int edit(int bno,String title, String content) {
		
		return mapper.edit(bno,title,content);
	}

	
}
