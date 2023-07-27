package com.peco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.peco.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/board/list")
	public void board(Model model) {
		
		service.getList(model);
		
		
	}

}
