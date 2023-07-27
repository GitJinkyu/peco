package com.peco.mapper;

import java.util.List;

import org.springframework.ui.Model;

import com.peco.vo.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList(Model model);

}
