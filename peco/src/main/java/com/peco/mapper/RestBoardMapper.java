package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.BoardVO;

public interface RestBoardMapper {
	
	public List<BoardVO> getMain();
	
	public List<BoardVO> getList(@Param(value="category")String category);
	
	public List<BoardVO> getFree();
	
	public List<BoardVO> getHealing();
	
	public BoardVO selectOne(@Param(value="bno") int bno);
	
	public int edit(@Param(value="bno") int bno,@Param("title") String title, @Param("content") String content);

}
