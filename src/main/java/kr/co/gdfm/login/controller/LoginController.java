package kr.co.gdfm.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdfm.common.util.CookieBox;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.service.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/login")
	public String login(
			@RequestParam(value="mem_id", required=true) String mem_id,
			@RequestParam(value="mem_pwd") String mem_pwd,
			@RequestParam(value="remember_me", required=false) String remember_me,
			HttpSession session,
			HttpServletResponse response,
			String url,
			Model model
			) throws Exception {
		
		Member member = memberService.getMember(mem_id);
		
		boolean isError = true;
		String message = "";
		
		if(member != null) {
			if(mem_pwd.equals(member.getMem_pwd())) {
				// 로그인 성공
					session.setAttribute("LOGIN_USER", member);
					message = member.getMem_name() + "님 환영합니다.";
					isError = false;
				// 쿠키 관련 처리
				if ("Y".equals(remember_me)) {
					response.addCookie(CookieBox.createCookie("USER_ID", member.getMem_id(), "/", 60 * 60 * 24 * 30));
					response.addCookie(CookieBox.createCookie("REMEMBER_ME", "Y", "/", 60 * 60 * 24));
				} else {
					response.addCookie(CookieBox.createCookie("USER_ID", "", "/", 0));
					response.addCookie(CookieBox.createCookie("REMEMBER_ME", "", "/", 0)); // 쿠키삭제
				}
			}else {
				message = "비밀번호가 일치하지 않습니다.";
			}
		}else {
			message = "해당 아이디가 존재하지 않습니다.";
		}
		
		model.addAttribute("isError",isError);
		model.addAttribute("message",message);
		if(member.getClass_code() == 99){
			model.addAttribute("locationURL","/admin/adminPage");	
		}else{
		model.addAttribute("locationURL","/"+url);
		}
		model.addAttribute("login","login");
		return "common/message";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(HttpSession session,
			HttpServletRequest request, Model model) {
	if(session.getAttribute("LOGIN_USER")!=null) {
		return "redirect:/"	;	
	}
		if(!StringUtils.isEmpty(request.getHeader("referer"))) {
			String url = "";
		url =request.getHeader("referer");
url = url.substring(url.indexOf("GoodDayForMovie/")+"GoodDayForMovie/".length());
model.addAttribute("url",url);
		}
		return "login/loginForm";

		}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
	

}
