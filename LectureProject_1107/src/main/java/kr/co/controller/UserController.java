package kr.co.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.UserService;
import kr.co.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	
	@Inject
	UserService service;
	
	
	@RequestMapping(value = "/user/adminList", method = RequestMethod.GET)
	public String adminList(Model model) throws Exception {
		
		model.addAttribute("userList", service.userList());
		
		return "/user/adminList";
	}
	
	@RequestMapping(value = "/user/joinForm", method = RequestMethod.POST)
	public String joinForm(UserVO vo) throws Exception {
		
		log.debug("yyw={}", vo.getUserNo());
		log.debug("yyw={}", vo.getName());
		log.debug("yyw={}", vo.getId());
		log.debug("yyw={}", vo.getPassword());
		log.debug("yyw={}", vo.getMail());
		log.debug("yyw={}", vo.getAuth());
		
		service.joinUser(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
		String loginid = login.getId();
		String loginPassword = login.getPassword();
		
		if(loginid == null) {
			return "redirect:/user/loginForm";
		}else {
			session.setAttribute("id", loginid);
			session.setAttribute("password", loginPassword);
		}
		
		log.debug("yyw={}", vo.getId());
		log.debug("yyw={}", vo.getPassword());
		
		return "redirect:/";
	}
	

	
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "/user/logout";
	}
	
	@RequestMapping(value = "/user/logininter", method = RequestMethod.GET)
	public String logininter() {
		
		return "user/logininter";
	}
	
	
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String join(UserVO vo) throws Exception{
		
		return "user/join";
	}
	
	@RequestMapping(value = "/user/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		
		return "user/loginForm";
	}
	
	@RequestMapping(value = "/user/userUpdateForm", method = RequestMethod.GET)
	public String userUpdate() {
		
		return "user/userUpdateForm";
	}
	

	
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(@RequestParam String id) throws Exception {
		System.out.println(id);
		UserVO idIs=service.idCheck(id);
		
		
		if(idIs!=null || id.equals("")) {
			return "0";
		}
		return "1";
	}
	
	

	
	

}
