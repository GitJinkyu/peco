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
	public List<BoardVO> getList(Model model) {
		
		return mapper.getList(model);
	}

}
