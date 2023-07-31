package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.peco.vo.Criteria;
import com.peco.vo.PageDto;
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
	public BoardVO selectOne(int bno) {
		return mapper.selectOne(bno);
	}

	@Override
	public List<BoardVO> getFree(Criteria cri,Model model) {
		/*
		 * 1.리스트 조회
		 * 		-검색어,페이지 정보(startNo~endNo까지 조회)
		 * 2.총건수 조회
		 * 3.pageDto 객체 생성
		 */
		List<BoardVO> list = mapper.getFree(cri);
		int totalCnt = mapper.getTotalCnt(cri);
		
		PageDto pageDto = new PageDto(cri,totalCnt);
		
		model.addAttribute("list",list);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageDto",pageDto);
		
		return list;
	}

	@Override
	public List<BoardVO> getHealing(Criteria cri,Model model) {
		/*
		 * 1.리스트 조회
		 * 		-검색어,페이지 정보(startNo~endNo까지 조회)
		 * 2.총건수 조회
		 * 3.pageDto 객체 생성
		 */
		List<BoardVO> list = mapper.getHealing(cri);
		int totalCnt = mapper.getTotalCnt(cri);
		
		PageDto pageDto = new PageDto(cri,totalCnt);
		
		model.addAttribute("list",list);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageDto",pageDto);
		
		return list;
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
