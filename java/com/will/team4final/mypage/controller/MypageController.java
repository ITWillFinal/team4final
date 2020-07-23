package com.will.team4final.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/mypageHome.do")
	public String mypage(@RequestParam String status) {
		logger.info("어느 마이페이지를 가야할까!?");
		
		if(status.equals("U")) {
			logger.info("일반회원 마이페이지로 가자!");
			return "mypage/mypageHome";
			
		}else if(status.equals("C")) {
			logger.info("기업회원 마이페이지로 가자!");
			
		}
		
		return "/index";
	}
}
