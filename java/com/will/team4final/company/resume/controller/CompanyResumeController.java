package com.will.team4final.company.resume.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.resume.model.CompanyResumeSetService;
import com.will.team4final.company.resume.model.CompanyResumeSetVO;
import com.will.team4final.company.resume.model.CompanyResumeUseService;
import com.will.team4final.company.resume.model.CompanyResumeUseVO;
import com.will.team4final.login.controller.LoginController;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;

@Controller
public class CompanyResumeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired private CompanyResumeSetService companyResumeSetService;
	@Autowired private CompanyResumeUseService companyResumeUseService;
	@Autowired private MemberService memberService;
	
	@RequestMapping(value = "/companypage/companyResumeSet.do", method = RequestMethod.GET)
	public String companyResumeSet_get(@RequestParam String recruitmentCode, Model model) {
		logger.info("기업 자사 이력서 설정 페이지");
		model.addAttribute("recruitmentCode", recruitmentCode);
		return "companypage/companyResumeSet";
	}
	
	@RequestMapping (value = "/companypage/companyResumeSet.do", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/companypage/companyResumeUse.do", method = RequestMethod.GET)
	public String resumeUse_get(@RequestParam String recruitmentCode,
			HttpSession session, Model model) {
		logger.info("기업 자사 이력서 사용 페이지");
		logger.info("파라미터 recruitmentCode={}", recruitmentCode);
		
		String userid = (String)session.getAttribute("userid");
		logger.info("userid={}", userid);
		
		MemberVO memberVo = memberService.selectByUserid(userid);
		logger.info("memberVo={}", memberVo);
		
		CompanyResumeSetVO vo = companyResumeSetService.selectCompanyResumeSet(recruitmentCode);
		logger.info("companyResumeUseVo={}", vo);
		
		model.addAttribute("userId", userid);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("vo", vo);
		return "companypage/companyResumeUse";
	}
	
	@RequestMapping(value = "/companypage/companyResumeUse.do", method = RequestMethod.POST)
	public String resumeUse_post(@ModelAttribute CompanyResumeUseVO companyResumeUseVo, Model model) {
		logger.info("기업 자사 이력서 입력 페이지, 파라미터 vo={}", companyResumeUseVo);
		
		//public CompanyResumeUseVO selectCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo);
		
		
		
		int cnt = companyResumeUseService.countCompanyResumeUse(companyResumeUseVo);
		int result = 0;
		
		if(cnt<1) {
			//1. 입력된 정보가 없으면 insert
			result = companyResumeUseService.insertCompanyResumeUse(companyResumeUseVo);
			logger.info("자사 이력서 입력 결과 result={}", result);
		}else {
			//2. 입력된 정보가 있으면 update
			result = companyResumeUseService.updateCompanyResumeUse(companyResumeUseVo);
			logger.info("자사 이력서 수정 결과 result={}", result);
		}
				
		String msg = "자사 이력서 작성 실패", url = "/companypage/companyResumeUse.do";
		if(result>0) {
			msg = "자사 이력서 작성 완료";
			url = "/companypage/companyResumeView.do?recruitmentCode="+companyResumeUseVo.getRecruitmentCode();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	//@RequestParam
	//do 뒤에 오거나 name의 밸류값
	
	//@ModelAttribute
	//한번에 넣고 처리할수 있도록

	
	@RequestMapping(value = "/companypage/companyResumeView.do", method = RequestMethod.GET)
	public String resumeView_get(@RequestParam String recruitmentCode, @ModelAttribute CompanyResumeUseVO companyResumeUseVo,
			HttpSession session, Model model) {
		logger.info("기업 자사 이력서 사용 후 뷰 페이지");
		logger.info("파라미터 recruitmentCode={}", recruitmentCode);
		
		String userid = (String)session.getAttribute("userid");
		logger.info("userid={}", userid);
		
		companyResumeUseVo.setUserId(userid);
		companyResumeUseVo.setRecruitmentCode(recruitmentCode);
				
		CompanyResumeUseVO vo = companyResumeUseService.selectCompanyResumeUse(companyResumeUseVo);
		logger.info("companyResumeUseVo={}", vo);
		
		model.addAttribute("userid", userid);
		model.addAttribute("vo", vo);
		return "companypage/companyResumeView";
	}
	
		
}
