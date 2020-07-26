package com.will.team4final.resume.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.resume.model.ResumeService;
import com.will.team4final.resume.model.ResumeVO;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private final static Logger logger = LoggerFactory.getLogger(ResumeController.class);
	@Autowired private ResumeService resumeService;
	@Autowired private MemberService memberService;
	
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.GET)
	public String resumeWrite_get(HttpSession session,Model model) {
		logger.info("이력서 작성 페이지");
		
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectAll(userid);
		
		logger.info("memberVo={}",memberVo);
		
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("MALE",MemberService.MALE);
		model.addAttribute("FEMALE",MemberService.FEMALE);
		
		return "resume/resumeWrite";
	}
	
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.POST)
	public String resumeWrite_post(@ModelAttribute ResumeVO resumeVo) {
		logger.info("이력서 등록, 파라미터 resumeVo={}",resumeVo);
		
		return "";
	}
	
	@RequestMapping(value = "/resumeMain.do")
	public String resumeMain() {
		logger.info("이력서 메인페이지");
		
		return "resume/resumeMain";
	}
	
	
}
