package com.spring.pension.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			logger.info("로그인안됨");
			saveDest(request);
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}
	// 현재 페이지에 대한 url주소 저장하는 부분 
	private void saveDest(HttpServletRequest req) {
		String  uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query ="";
			
		}else {
			query ="?"+query;
		}
		if(req.getMethod().equals("GET")) {
			logger.info("dest:" + (uri+query));
			req.getSession().setAttribute("dest", uri+query);
			
		}
	}
}
