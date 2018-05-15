package com.spring.pension.interceptor;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN="login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	//session에 vo넣고 root페이지로 이동 
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelMap = mav.getModelMap();
		Object userVO = modelMap.get("vo");
		logger.info("interceptor" + userVO);
		if(userVO!=null) {
			session.setAttribute(LOGIN, userVO);
			/*response.sendRedirect("/");*/
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest!=null?(String)dest:"/"); //session에 저장
			logger.info("로그인 성공");
		}else {
			logger.info("로그인 실패");
			mav.addObject("msg", "false");
			mav.setViewName("/user/error");
		}
	}
	//세션 삭제하는 부분
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) !=null) {
			logger.info("session에 있는 정보" + session.getAttribute(LOGIN));
			session.removeAttribute(LOGIN);
		}
		return true;
	}
}
