package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.peco.vo.BoardVO;

@Service
public interface BoardService {
	
	public List<BoardVO> getList(Model model);

}
