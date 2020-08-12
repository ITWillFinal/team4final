package com.will.team4final.pass.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.company.info.model.CompanyInfoService;
import com.will.team4final.company.info.model.CompanyInfoVO;

@Controller
@RequestMapping("/pass")
public class PassController {
	private Logger logger = LoggerFactory.getLogger(PassController.class);
	
	@Autowired private CompanyInfoService companyInfoService;
	
	@RequestMapping("/companyList.do")
	public String companyList(Model model) {
		
		logger.info("합격스펙 - 기업목록");
		
		List<CompanyInfoVO> list = companyInfoService.selectCompanyInfo();
		
		model.addAttribute("list",list);
		
		return "pass/companyList";
	}
}
