package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.ReplyMapper;
import com.peco.vo.Criteria;
import com.peco.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Override
	public List<ReplyVO> getList(int bno, Criteria cri) {
		
		return mapper.getList(bno, cri);
	}

	@Override
	public int insert(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(int rno) {

		return mapper.delete(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int totalCnt(int bno) {
		return mapper.totalCnt(bno);
	}


}
