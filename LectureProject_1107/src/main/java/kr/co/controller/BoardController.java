package kr.co.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import kr.co.service.BoardService;
import kr.co.service.UserService;
import kr.co.vo.LectureVO;
import kr.co.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class BoardController {
	
	@Inject
	BoardService service;
	
	@Inject
	UserService userService;

	// 수강신청목록
	@RequestMapping(value = "/board/appLecture", method = RequestMethod.GET)
	public String appLecture(Model model, HttpSession session, PagingVO vo, String nowPage, String cntPerPage) throws Exception{
		
		String id = (String)session.getAttribute("id");
		
		int total = service.lectureCount();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("loginId", userService.oneInfo(id));
		model.addAttribute("paging", vo);
		model.addAttribute("lectList", service.selectLecture(vo));
		
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
	
	// 수강신청하기
	@RequestMapping(value = "/board/appLecture", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> signList(Integer signUserNo,  @RequestParam(value="arr[]") List<Integer> arr) throws Exception{
		
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("signUserNo", signUserNo);

		for(int i = 0; i < arr.size(); i++) {
			param.put("signLectureNo", arr.get(i));
			service.signList(param);
			
			int signNo = (Integer)param.get("signLectureNo");
			service.nowPeopleAdd(signNo);
			}
		
		return returnMap;
	}
	
	// 단일 수강신청하기
	@RequestMapping(value = "/board/appLectureOne", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> appLectureOne(@RequestParam Integer signLectureNo, HttpSession session) throws Exception {
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();

		param.put("signLectureNo", signLectureNo);
		
		String id = (String)session.getAttribute("id");
		int signUserNo = userService.oneNo(id);
		
		param.put("signUserNo", signUserNo);
		
		service.signList(param);
		
		int signNo = (Integer)param.get("signLectureNo");
		service.nowPeopleAdd(signNo);
		
		return returnMap;
	}
	
	
	@RequestMapping(value = "/board/addStudy", method = RequestMethod.GET)
	public String addStudy() {
		
		return "/board/addStudy";
	}
	
	@RequestMapping(value = "/board/addStudy", method = RequestMethod.POST)
	public @ResponseBody String addStudy2(LectureVO vo) throws Exception{
		
		service.addLecture(vo);
		
		return "1";
	}
	

	@RequestMapping(value = "/board/teacherList", method = RequestMethod.GET)
	public String teacherList(LectureVO vo, HttpSession session, Model model) throws Exception {
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("list", service.teacherList(id));
		
		return "/board/teacherList";
	}
	

	
	@RequestMapping(value = "/board/myStudy", method = RequestMethod.GET)
	public String myStudy(HttpSession session, Model model) throws Exception {
		
		String id = (String)session.getAttribute("id");
		
		int changeId = service.changeId(id);
		
		model.addAttribute("list", service.addList(changeId));
		
		log.debug("yyw={}",service.addList(changeId));
		
		return "/board/myStudy";
	}
	
	@RequestMapping(value = "/board/reqList", method = RequestMethod.GET)
	public String reqList() {
		
		return "/board/reqList";
	}
	

}
