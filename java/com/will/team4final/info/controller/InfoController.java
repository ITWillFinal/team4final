package com.will.team4final.info.controller;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.application.controller.ApplicationController;

@Controller
@RequestMapping("/info")
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);
	
	@RequestMapping("/info.do")
	public void info_get(HttpSession session, Model model) {
		String userid = (String )session.getAttribute("userid");
		model.addAttribute("userid", userid);
	}
	
	@RequestMapping("/ciPage.do")
	public String ciPage() {
		logger.info("ciPage 입니다");
		return "info/ciPage";
	}
	
	@RequestMapping("/practice.do")
	public String practice() {
		logger.info("practice 입니다");
		return "info/practice";
	}

}
