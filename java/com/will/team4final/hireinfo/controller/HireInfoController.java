package com.will.team4final.hireinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.login.controller.LoginController;

@Controller
@RequestMapping("/companypage")
public class HireInfoController {

private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/companyHome.do")
	public String companyHome() {
		logger.info("기업페이지 홈");
		
		return "companypage/companyHome";
	}
}
