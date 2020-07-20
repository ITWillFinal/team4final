package com.will.team4final.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.login.controller.LoginController;

@Controller
public class CompanyHomeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/hireinpo/hireinpo.do")
	public String hireinpoHome() {
		logger.info("채용정보 홈");
		
		return "hireinpo/hireinpo";
	}
	
	@RequestMapping("/companypage/member/companyJoin.do")
	public void companyJoin() {
		logger.info("기업회원가입 페이지");
		
	}
	
	@RequestMapping("/companypage/companyWrite.do")
	public String write() {
		logger.info("기업페이지 채용공고등록");
		
		return "companypage/companyWrite";
	}
	
	
	
	
}
