package com.will.team4final.company.info.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/companypage")
public class CompanyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyInfoController.class);
	
	@RequestMapping("/companyInfoWrite.do")
	public void comInfoView() {
		logger.info("회사 정보 입력 화면");
	}
	
	
	
	
}
