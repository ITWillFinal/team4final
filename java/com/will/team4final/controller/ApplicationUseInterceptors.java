package com.will.team4final.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class ApplicationUseInterceptors extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(ApplicationUseInterceptors.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("MypageUseInterceptors preHandle() 실행");
		HttpSession session = request.getSession();
		
		String userid = (String)session.getAttribute("userid");
		
		if(userid == null || userid.isEmpty()) {
			request.setAttribute("msg", "로그인 후 사용가능합니다.");
			request.setAttribute("url", "/index.do");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			return false;
		}else {
			return true;
			
		}
		
	}
	
}
