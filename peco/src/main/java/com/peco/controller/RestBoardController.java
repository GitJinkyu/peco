package com.peco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.RestBoardService;
import com.peco.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RestBoardController {
	
	@Autowired
	RestBoardService service;
	
    @GetMapping("/rest/{bno}")
    public String selectOne(@PathVariable int bno, Model model) {
        BoardVO board = service.selectOne(bno);
        model.addAttribute("board", board);
        return "/board/restview"; // 상세보기 페이지의 JSP 파일 이름
    }
	
    @GetMapping("/rest/edit/{bno}")
    public String editForm(@PathVariable int bno, Model model) {
        BoardVO board = service.selectOne(bno);
        model.addAttribute("board", board);
        return "/board/editForm"; // 수정 화면을 보여주는 JSP 파일 이름
    }
    
    
    @PutMapping("/rest/edit/{bno}")
    @ResponseBody
    public ResponseEntity<String> edit(@PathVariable int bno, @RequestBody BoardVO boardvo) {
        int res = service.edit(bno, boardvo.getTitle(), boardvo.getContent());
        if (res > 0) {
            return new ResponseEntity<>("success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



}
