package com.will.team4final.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/adminMain.do")
	public void adminMain() {
		logger.info("관리자 메인 홈!");
	}
	
	@RequestMapping("/adminNotice.do")
	public String adminNotice() {
		logger.info("공지사항 관리 페이지");
		
		return "admin/adminNotice";
	}

}
