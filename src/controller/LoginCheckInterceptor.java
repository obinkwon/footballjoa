package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//스프링 인터셉터 구현
//1.HandlerInterceptorAdapter 상속하는 클래스 정의
//2.preHandle 메소드를 오버라이드한다
//3.클래스를 빈으로 등록(component)
//4.인터셉터를 구현한 빈에 인터셉터 설정(스프링 설정 파일 : xml)
@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override	//작업을 수행하기전에 호출할 메소드
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//로그인 체크
		HttpSession session  = request.getSession();
		if(session.getAttribute("session_id")==null) {
			response.sendRedirect("loginForm.do");
			return false;
		}
		else return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	
}
