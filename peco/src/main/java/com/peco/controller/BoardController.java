package com.peco.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.peco.service.BoardService;
import com.peco.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/board/main")
	public void board(Model model) {

		List<BoardVO> list = service.getMain(model);
		
		model.addAttribute("list",list);
	}
	
	@GetMapping("/board")
	public String freeboard(@RequestParam("category") String category, Model model) {

		List<BoardVO> list = service.getList(category,model);
		
		model.addAttribute("list",list);
		

        // category에 따라서 다른 뷰로 매핑되도록 합니다.
        if ("free".equals(category)) {
            return "board/free"; // WEB-INF/views/board/free.jsp
        } else if ("healing".equals(category)) {
            return "board/healing"; // WEB-INF/views/board/healing.jsp
        } else {
            // 기타 경우, 예외처리 또는 기본 뷰를 반환할 수 있습니다.
            return "board/boardmain"; // 예를 들어, 에러 페이지로 이동하거나 기본 뷰로 이동할 수 있습니다.
        }
	}
	
	@GetMapping("/board/view")
	public void selectOne(Model model,BoardVO paramVO) {
		
		BoardVO board = service.selectOne(paramVO.getBno());
		
		model.addAttribute("board",board);
		
	}
	

}
