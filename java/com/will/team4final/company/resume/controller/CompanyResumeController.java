package com.will.team4final.company.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.resume.model.CompanyResumeSetService;
import com.will.team4final.company.resume.model.CompanyResumeSetVO;
import com.will.team4final.login.controller.LoginController;

@Controller
@RequestMapping("/companypage")
public class CompanyResumeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired private CompanyResumeSetService companyResumeSetService;
	
	@RequestMapping(value = "/companyResumeSet.do", method = RequestMethod.GET)
	public String companyResumeSet_get(@RequestParam String recruitmentCode, Model model) {
		logger.info("기업 자사 이력서 설정 페이지");
		model.addAttribute("recruitmentCode", recruitmentCode);
		return "companypage/companyResumeSet";
	}
	
	@RequestMapping (value = "/companyResumeSet.do", method = RequestMethod.POST)
	public String companyResumeSet_post(@ModelAttribute CompanyResumeSetVO companyResumeSetVo, Model model) {
		logger.info("기업 자사 이력서 설정 페이지, 파라미터 vo={}", companyResumeSetVo);
		int cnt = companyResumeSetService.insertCompanyResumeSet(companyResumeSetVo);
		logger.info("자사 이력서 설정 결과 cnt={}", cnt);
		
		String msg = "자사 이력서 설정 실패", url = "/companypage/companyResumeSet.do";
		if(cnt>0) {
			msg = "자사 이력서 설정 성공";
			url = "/companypage/companyHome.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/companyResumeUse.do")
	public String resumeUse() {
		logger.info("기업페이지 자사 이력서양식 제작");
		
		return "companypage/companyResumeUse";
	}
}
