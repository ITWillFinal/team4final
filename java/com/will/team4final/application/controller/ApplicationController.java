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

import com.will.team4final.apply.model.ApplyService;
import com.will.team4final.apply.model.ApplyVO;
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
	@Autowired private ComRecruitService comRecuritService;
	@Autowired private MemberService memberService;
	@Autowired private ResumeService resumeService;
	@Autowired private ApplyService applyService;
	
	@RequestMapping("/applicationResume.do")
	public String applicationResume(@RequestParam String recruitmentCode,
			HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		logger.info("회사 지원 페이지 userid={}, recruitmentCode={}",userid,recruitmentCode);
		
		Recruitment_TosVO vo = comRecuritService.selectTosOneCom(recruitmentCode);
		logger.info("회사 지원 페이지 vo={}",vo);
		
		
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("vo",vo);	
		
		if(vo.getResumeType()==1) {
			return "application/applicationResume1";			
		}
		
		List<ResumeVO> resumeList = resumeService.selectResumeByUserNo(memberVo.getUserNo());
		model.addAttribute("resumeList",resumeList);
		
		return "application/applicationResume0";
	}
	
	@RequestMapping("/apply.do")
	public String apply(@RequestParam String recruitmentCode, @RequestParam String resumeNo,
			HttpSession session,Model model) {
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		String userNo = memberVo.getUserNo();
		logger.info("회사 지원 페이지 userNo={}, recruitmentCode={}",userNo,recruitmentCode);
		
		
		ApplyVO applyVo = new ApplyVO();
		applyVo.setUserNo(userNo);
		applyVo.setResumeNo(resumeNo);
		applyVo.setRecruitmentCode(recruitmentCode);
		
		int cnt = applyService.insertApply(applyVo);
		logger.info("입사 지원 결과 cnt = {}",cnt);
		
		Recruitment_TosVO vo = comRecuritService.selectTosOneCom(recruitmentCode);
		
		model.addAttribute("vo",vo);
		model.addAttribute("cnt",cnt);

		if(cnt==0) {
			String msg="error:입사 지원에 실패했습니다.", url="/hireinpo/infoDetailGo.do?recruitmentCode="+recruitmentCode;
			model.addAttribute("url",url);
			model.addAttribute("msg",msg);
			
			return "common/message";
		}else if(cnt==-1) {
			String msg="이미 지원하였습니다. 재지원 시 취소후 다시 진행해주세요.", url="/hireinpo/infoDetailGo.do?recruitmentCode="+recruitmentCode;
			model.addAttribute("url",url);
			model.addAttribute("msg",msg);
			
			return "common/message";			
		}
		
		
		model.addAttribute("memberVo",memberVo);
		return "application/apply";
	}
	
	@RequestMapping("/applicationDelete.do")
	public String applicationDelete(@RequestParam(required = false) String applyCode, Model model) {
		if(applyCode ==null || applyCode.isEmpty()) {
			String msg="잘못된 경로입니다.", url="/member/currentApply.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		int cnt = applyService.deleteApply(applyCode);
		String msg="삭제 실패했습니다.", url="/member/currentApply.do";
		if(cnt>0) {
			msg="삭제 성공했습니다";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
}
