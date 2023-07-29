package com.peco.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.peco.vo.BoardVO;

@Service
public interface BoardService {
	
	public List<BoardVO> getMain();
	
	public List<BoardVO> getFree();
	
	public List<BoardVO> getHealing();
	
	public List<BoardVO> getList(String category);
	
	public BoardVO selectOne(int bno);

}
