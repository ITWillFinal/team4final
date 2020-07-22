package com.will.team4final.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.team4final.resume.model.ResumeService;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private final static Logger logger = LoggerFactory.getLogger(ResumeController.class);
	@Autowired private ResumeService resumeService;
	
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.GET)
	public String resumeWrite_get() {
		logger.info("이력서 작성 페이지");
		return "resume/resumeWrite";
	}
}
