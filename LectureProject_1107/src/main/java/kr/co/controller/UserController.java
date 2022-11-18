package kr.co.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.UserService;
import kr.co.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	
	@Inject
	UserService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Inject
    private JavaMailSender mailSender;
	
	
	@RequestMapping(value = "/user/adminList", method = RequestMethod.GET)
	public String adminList(Model model) throws Exception {
		
		model.addAttribute("userList", service.userList());
		
		return "/user/adminList";
	}
	
	@RequestMapping(value = "/user/joinForm", method = RequestMethod.POST)
	public String joinForm(UserVO vo) throws Exception {
		
    		//log.debug("yywe={}", fieldError.getDefaultMessage());
		
		String inputPass = vo.getPassword();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setPassword(pwd);
		
		service.joinUser(vo);
		
		return "/user/completJoin";
	}
	
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		session.getAttribute("member");
		
		UserVO login = service.login(vo);
		String loginid = login.getId();
		String auth = login.getAuth();
		String name = login.getName();
		
		boolean pwdMatch = pwdEncoder.matches(vo.getPassword(), login.getPassword());

		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);
			session.setAttribute("id", loginid);
			session.setAttribute("auth", auth);
			session.setAttribute("name", name);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}


		return "redirect:/";
	}
	
    
	@RequestMapping(value = "/user/mailCheck", method = RequestMethod.GET)
    public @ResponseBody String mailCheck(@RequestParam String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        System.out.println("이메일 데이터 전송 확인");
        System.out.println("인증번호 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        
        log.debug("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "yyandsoon@naver.com";
        String toMail = email;
        String title = "수강신청 인증 이메일 입니다.";
        String content = 
                "수강신청 사이트 인증 메일입니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
        
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
	public String userUpdateForm(HttpSession session, UserVO vo, Model model) throws Exception {
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("list", service.oneInfo(id));
		
		return "user/userUpdateForm";
	}
	
	@RequestMapping(value = "/user/userUpdate", method = RequestMethod.POST)
	public String userUpdate(UserVO vo, Model model) throws Exception {
		
		service.updateUser(vo);
				
		return "user/updatecomplet";
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
