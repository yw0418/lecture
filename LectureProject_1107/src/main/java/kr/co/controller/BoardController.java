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
	public String appLecture(Model model, HttpSession session) throws Exception{
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("loginId", userService.oneInfo(id));
		System.out.println(service.lectureList());
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
	
	// 수강신청하기
	@RequestMapping(value = "/board/appLecture", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> signList(HttpServletRequest request) throws Exception{
		
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		System.out.println("=============================");
		System.out.println("reqMap : " + request.getParameter("signUserNo"));
		System.out.println("reqMap : " + request.getParameter("signUserNo"));
		//System.out.println("reqMap : " + Arrays.asList(request.getParameterValues("arr")));
		System.out.println("=============================");
		
		param.put("signUserNo", request.getParameter("signUserNo"));
		List<String> arr = Arrays.asList(request.getParameter("arr"));
		
				
		
		for(int i = 0; i < arr.size(); i++) {
			 param.put("signLectureNo", arr.get(i));
			 System.out.println(arr.get(i)); service.signList(param); }
		 
		
				service.signList(param);
		//service.nowPeopleAdd(vo.getSignLectureNo());
		
		return returnMap;
	}
	
	
	@RequestMapping(value = "/board/addStudy", method = RequestMethod.GET)
	public String addStudy() {
		
		return "/board/addStudy";
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
