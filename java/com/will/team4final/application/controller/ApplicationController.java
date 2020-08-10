package com.will.team4final.application.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.Recruitment_TosVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.resume.model.ResumeService;
import com.will.team4final.resume.model.ResumeVO;



@Controller
@RequestMapping("/application")
public class ApplicationController {
	private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);
	@Autowired private ComRecruitService comRecuritServ;
	@Autowired private MemberService memberService;
	@Autowired private ResumeService resumeService;
	
	@RequestMapping("/applicationResume.do")
	public String applicationResume(@RequestParam(defaultValue = "0") String recruitmentCode,
			HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		logger.info("회사 지원 페이지 userid={}, recruitmentCode={}",userid,recruitmentCode);
		
		/* Recruitment_TosVO vo = comRecuritServ.selectTosOneCom(recruitmentCode); */
		
		model.addAttribute("memberVo",memberVo);
		
		/*
		model.addAttribute("vo",vo);		
		if(vo.getResumeType()==1) {
			return "application/applicationResume1";			
		}*/
		
		List<ResumeVO> resumeList = resumeService.selectResumeByUserNo(memberVo.getUserNo());
		model.addAttribute("resumeList",resumeList);
		
		return "application/applicationResume0";
	}
	
	@RequestMapping("/apply.do")
	public String apply(@RequestParam(defaultValue = "0") String recruitmentCode,
			HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		String userNo = memberVo.getUserNo();
		logger.info("회사 지원 페이지 userNo={}, recruitmentCode={}",userNo);
		
		return "";
	}
	
	
}
