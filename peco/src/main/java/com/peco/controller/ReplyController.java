package com.peco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.peco.vo.Criteria;
import com.peco.vo.PageDto;
import com.peco.vo.ReplyVO;
import com.peco.controller.CommonRestController;
import com.peco.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReplyController extends CommonRestController{
	
	@Autowired
	ReplyService service;
	
	@GetMapping("/reply/list/{bno}/{page}")
	public Map<String,Object> getList(@PathVariable("bno") int bno,@PathVariable("page") int page){
		
		
		log.info("bno : "+bno);
		log.info("page : "+page);
		
		Criteria cri =  new Criteria();
		cri.setPageNo(page);
		
		//페이지 처리 (시작번호~끝번호)
		List<ReplyVO> list =service.getList(bno, cri);
		int totalCnt = service.totalCnt(bno);
		
		//페이지 블럭을 생성
		PageDto pageDto = new PageDto(cri, totalCnt) ;
		
//		Map<String,Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("pageDto",pageDto);
//		
//		return map;
		
		return responseListMap(list, pageDto);
	}

}
