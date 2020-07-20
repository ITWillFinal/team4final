package com.will.team4final.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.login.controller.LoginController;

@Controller
public class CompanyHomeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired private ComMemberService cMemberSerice;
	
	@RequestMapping("/hireinpo/hireinpo.do")
	public String hireinpoHome() {
		logger.info("채용정보 홈");
		
		return "hireinpo/hireinpo";
	}
	
	@RequestMapping("/companypage/member/companyJoin.do")
	public void companyJoin() {
		logger.info("기업회원가입 페이지");
		
	}
	
	@RequestMapping("/companypage/member/checkUserid.do")
	public String checkcUserid(@RequestParam String cUserid, Model model) {
		logger.info("기업회원 아이디 중복확인, 파라미터 cUserid={}", cUserid);
		if(cUserid==null || cUserid.isEmpty()) {
			return "companypage/member/checkUserid";
		}
		
		int result = cMemberSerice.selectCMemberDup(cUserid);
		
		logger.info("기업회원 아이디 중복확인 결과, result={}", result);
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID",ComMemberService.EXIST_ID);
		model.addAttribute("NON_EXIST_ID",ComMemberService.NON_EXIST_ID);

		return "companypage/member/checkUserid";
		
	}
}
