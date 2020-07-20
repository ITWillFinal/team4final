package com.will.team4final.jobsearch.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.login.controller.LoginController;

@Controller
@RequestMapping("/jobsearch")
public class JobSearchController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/maptest.do")
	public String maptest() {
		logger.info("맵테스트");
		
		return "jobsearch/maptest";
	}
}
