package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;
import kr.co.vo.LectureVO;
import kr.co.vo.UserVO;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class BoardController {

	//private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면

	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{

	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		//logger.info("write");
		
		service.write(boardVO);
		
		
		return "redirect:/";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		
		model.addAttribute("list",service.list());

		log.debug("logyw={}");
		return "board/list";
		
	}
	
	// 위에까진 test용
	// 아래부터 실코드
	
	// 수강신청목록
	@RequestMapping(value = "/board/appLecture", method = RequestMethod.GET)
	public String appLecture(Model model) throws Exception{
		
		model.addAttribute("lectList", service.lectureList());
		
		log.debug("yw0418={}", service.lectureList());
		return "/board/appLecture";
	}
	
	// 글 하나 불러오기
	@RequestMapping(value = "/board/contentList", method = RequestMethod.GET)
	public String contentList(@RequestParam("lectureNo") int lectureNo, Model model) throws Exception {
		
		model.addAttribute("list", service.contentList(lectureNo));
		
		return "/board/contentList";
	}
	
	// 수강신청
	@RequestMapping(value = "/board/addForm", method = RequestMethod.GET)
	public @ResponseBody String addForm(@RequestParam("lectureNo") int lectureNo, Model model) throws Exception {
		
		model.addAttribute("list", service.contentList(lectureNo));
		
		return "/board/addForm";
	}
	
	
	@RequestMapping(value = "/board/addStudy", method = RequestMethod.GET)
	public String addStudy() {
		
		return "/board/addStudy";
	}
	

	@RequestMapping(value = "/board/teacherList", method = RequestMethod.GET)
	public String teacherList(LectureVO vo, HttpSession session, Model model) throws Exception {
		
		String id = (String)session.getAttribute("id");
		log.debug("ywid={}", id);
		log.debug("ywlist={}", service.teacherList(id));
		
		model.addAttribute("list", service.teacherList(id));
		
		return "/board/teacherList";
	}
	

	
	@RequestMapping(value = "/board/myStudy", method = RequestMethod.GET)
	public String myStudy() {
		
		return "/board/myStudy";
	}
	
	@RequestMapping(value = "/board/reqList", method = RequestMethod.GET)
	public String reqList() {
		
		return "/board/reqList";
	}
	

}
