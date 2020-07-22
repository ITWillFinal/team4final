package com.will.team4final.hireinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.login.controller.LoginController;

@Controller
public class HireInfoController {

private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@RequestMapping("/hireinpo/hireinpo.do")
	public String hireinpoHome() {
		logger.info("채용정보 홈");
		
		return "hireinpo/hireinpo";
	}
}
