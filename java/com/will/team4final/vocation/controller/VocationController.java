package com.will.team4final.vocation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vocation")
public class VocationController {
	private static final Logger logger = LoggerFactory.getLogger(VocationController.class);
	
	@RequestMapping("/vocationalTest.do")
	public void vocationalTest() {
		logger.info("직업 탐험대!");
	}
}
