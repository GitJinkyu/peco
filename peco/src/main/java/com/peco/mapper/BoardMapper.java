package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.peco.vo.BoardVO;

public interface BoardMapper {
	
	
	public List<BoardVO> getMain();
	
	public List<BoardVO> getList(@Param(value="category")String category,Model model);
	
	public BoardVO selectOne(@Param(value="bno") int bno);

}
