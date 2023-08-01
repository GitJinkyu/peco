package com.peco.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peco.service.BoardService;
import com.peco.service.FileuploadService;
import com.peco.vo.BoardVO;
import com.peco.vo.Criteria;
import com.peco.vo.FileuploadVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/peco/*")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	FileuploadService fservice;
	
	
	@GetMapping("/board/main")
	public String board(Model model,Criteria cri) {

		List<BoardVO> Free = service.getFree(cri, model);
		List<BoardVO> Healing = service.getHealing(cri,model);
		
		model.addAttribute("Free",Free);
		model.addAttribute("Healing",Healing);
		
		return "board/main";
		
	}
	
	@GetMapping("/board/free")
	public String free(Model model,Criteria cri) {
		
		List<BoardVO> list = service.getFree(cri,model);
		
		model.addAttribute("list",list);
		
		return "board/free";
	}
	
	@GetMapping("/board/healing")
	public String healing(Model model,Criteria cri) {
		
		List<BoardVO> list = service.getHealing(cri,model);
		
		model.addAttribute("list",list);
		
		return "board/healing";
	}
	
	/*
	 * @GetMapping("/board") public String freeboard(@RequestParam("category")
	 * String category, Model model) {
	 * 
	 * List<BoardVO> list = service.getList(category);
	 * 
	 * model.addAttribute("list",list);
	 * 
	 * 
	 * // category에 따라서 다른 뷰로 매핑되도록 합니다. if ("free".equals(category)) { return
	 * "board/free"; // WEB-INF/views/board/free.jsp } else if
	 * ("healing".equals(category)) { return "board/healing"; //
	 * WEB-INF/views/board/healing.jsp } else { // 기타 경우, 예외처리 또는 기본 뷰를 반환할 수 있습니다.
	 * return "board/boardmain"; // 예를 들어, 에러 페이지로 이동하거나 기본 뷰로 이동할 수 있습니다. } }
	 */
	
	@GetMapping("/board/write")
	public String write() {
		
		return "board/write";
	}
	
	@PostMapping("/board/write")
	public String writeAction(Model model,BoardVO boardvo,RedirectAttributes rttr,List<MultipartFile> files) {
		System.out.println("작성 포스트 진입");
		
		log.info(boardvo);
		
		int res;
		try {
			//board.getBno로 값을 가져오기 위해 insertSelectKey를 써야함
			//시퀀스를 먼저 조회후 시퀀스 번호를 bno에 저장 하고 난 후에 실행함
			//게시물 등록 및 파일 첨부
			res = service.insertSelectKey(boardvo,files);
			
			System.out.println(res);
			String msg = "";
			
			if(res>0) {
				
				msg = boardvo.getBno()+"번 등록되었습니다.";
			
				//rttr.addAttribute는 
				//url?msg=등록되었습니다 (쿼리스트링으로 전환됨. 화면에서 받을때 param.으로 받아야함)
				//rttr.addAttribute("msg",msg);
				
				//세션영역에 잠시 저장 -> param. 안붙이고 msg로 호출 가능
				//잠깐 쓰고 사라지기때문에 새로고침시 유지되지않음
				rttr.addFlashAttribute("msg",msg);
				
				return "redirect:/peco/board/main";
				
			}else {
				msg="등록중 오류가 발생하였습니다.";
				model.addAttribute("msg",msg);
				return "/board/free";
			}
			
		} catch (Exception e) {
			log.info(e.getMessage());
			if(e.getMessage().indexOf("첨부파일")> -1) {
				model.addAttribute("msg",e.getMessage());
			}else {
				model.addAttribute("msg","등록중 예외사항이 발생하였습니다.");	
			}
			e.printStackTrace();
			return "/board/free";
		}
				
	}
	
	
	
	
	@GetMapping("/board/view")
	public String selectOne(Model model,BoardVO paramVO) {
		
		BoardVO board = service.selectOne(paramVO.getBno());
		
		List<FileuploadVO> filelist = fservice.getPath(paramVO.getBno());
		
	    // 파일 경로를 슬래시(/)로 변경
	    if (filelist != null) {
	    	for (FileuploadVO file : filelist) {
	        String convertedPath = file.getSavePath().replace("\\", "/");
	        String convertedThumPath = file.getS_savePath().replace("\\", "/");
	        file.setSavePath(convertedPath);
	        file.setS_savePath(convertedThumPath);
	    	}
	    }
		
		model.addAttribute("board",board);
		model.addAttribute("filelist",filelist);
		
		
		
		return "board/view";
		
	}
	
	@GetMapping("/board/delete")
	public String delete(RedirectAttributes rttr ,BoardVO board,Model model) {
		
		int res = service.delete(board.getBno());
		
		if(res > 0) {
			
			rttr.addFlashAttribute("msg","삭제 되었습니다.");
			return "redirect:/board/free";
		}else {
			model.addAttribute("msg","삭제중 예외가 발생하였습니다.");
			return "/board/free";
		}
	}
	

}
