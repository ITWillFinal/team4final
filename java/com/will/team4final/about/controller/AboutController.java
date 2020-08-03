package com.will.team4final.about.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/about")
public class AboutController {
	private static final Logger logger = LoggerFactory.getLogger(AboutController.class);
	
	@RequestMapping("/thejobLocation.do")
	public String thejobLocation() {
		return "aboutThejob/thejobLocation";
	}
}
