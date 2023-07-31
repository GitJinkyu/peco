package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.peco.vo.Criteria;
import com.peco.vo.BoardVO;

public interface BoardMapper {
	
	
	public List<BoardVO> getMain();
	
	public List<BoardVO> getFree(Criteria cri);
	
	public List<BoardVO> getHealing(Criteria cri);
	
	public BoardVO selectOne(@Param(value="bno") int bno);
	
	public int insertSelectKey(BoardVO boardvo);
	
	public int delete(int bno);
	
	public int getTotalCnt(Criteria cri);
	
	public int updateReplyCnt(@Param("bno") int bno,@Param("amount") int amount);

}
