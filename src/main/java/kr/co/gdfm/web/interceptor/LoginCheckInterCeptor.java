package kr.co.gdfm.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterCeptor extends HandlerInterceptorAdapter  {
	
	
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {

	HttpSession session = request.getSession(true);
	
	//세션 자체가 없을땐 접근금지
	if (session==null) {
		response.sendError(HttpServletResponse.SC_FORBIDDEN);
		return false;
		
	}
	if(session.getAttribute("LOGIN_USER")==null) {
		response.sendRedirect(request.getContextPath() + "/login/loginForm");
		return false;
		
	}
	
	
	
	
	
	return true;
	
}



}
