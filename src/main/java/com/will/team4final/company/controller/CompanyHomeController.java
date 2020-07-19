package com.will.team4final.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.login.controller.LoginController;

@Controller
public class CompanyHomeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/companypage/companyHome.do")
	public String home() {
		logger.info("기업페이지 홈");
		
		return "companypage/companyHome";
	}
	
	@RequestMapping("/companypage/companyWrite.do")
	public String write() {
		logger.info("기업페이지 채용공고등록");
		
		return "companypage/companyWrite";
	}
	
	
	
	
}
