package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;


@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.debug("writeView");
		logger.debug("ywtest");
		
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		//logger.info("write");
		
		service.write(boardVO);
		
		logger.debug("test log={}", boardVO.getContent());
		logger.debug("test log2={}", boardVO.getTitle());
		
		return "redirect:/";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.debug("list");
		
		model.addAttribute("list",service.list());
		
		logger.debug("test");
		logger.debug("test log={}", "list");
		System.out.println("testconsole");
		
		return "board/list";
		
	}
}
