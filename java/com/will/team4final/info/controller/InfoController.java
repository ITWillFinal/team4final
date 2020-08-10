package com.will.team4final.info.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@RequestMapping("/info.do")
	public void info_get(HttpSession session, Model model) {
		String userid = (String )session.getAttribute("userid");
		model.addAttribute("userid", userid);
		
		
	}
}
