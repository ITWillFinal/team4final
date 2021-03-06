package com.will.team4final.mypage.controller;

import java.util.List;
import java.util.Map;

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
import com.will.team4final.company.info.model.CompanyInfoService;
import com.will.team4final.company.info.model.CompanyInfoVO;
import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.company.model.Recruitment_TosVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.resume.model.ResumeService;
import com.will.team4final.resume.model.ResumeVO;
import com.will.team4final.scrap.model.ComScrapService;
import com.will.team4final.scrap.model.ComScrapVO;

@Controller 
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private ComScrapService comScrapServ;
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private ComRecruitService comRecruitServ;
	@Autowired private MemberService memberServ;
	@Autowired private ComMemberService comMemberServ;
	@Autowired private CompanyInfoService comInfoServ;
	
	@RequestMapping("/mypageHome.do")
	public String mypage(@RequestParam String status, HttpSession session, Model model) {
		if(status.equals("U")) {
			logger.info("일반회원 마이페이지로 가자!");
			String userNo = (String)session.getAttribute("userNo");
			int scrap = comScrapServ.selectComScrapNum(userNo);
			
			List<ResumeVO> list = resumeService.selectResumeByUserNo(userNo);
			
			
			//지원 숫자 구하기
			List<ApplyVO> applyListVo = memberServ.selectApplyByuserNo(userNo);
			logger.info("일반회원, applyListVo.size()={}", applyListVo.size());
			int applyNum = applyListVo.size();
			
			//회원 정보 구하기
			MemberVO memberVo = memberServ.selectByUerNo(userNo);
			logger.info("memberVo={}", memberVo);
			
			//회원 년도 구하기
			String birth1 = memberVo.getBirth();
			String birth = birth1.substring(0,2);
			logger.info("birth={}", birth);
			
			
			model.addAttribute("applyNum", applyNum);
			model.addAttribute("birth", birth);
			model.addAttribute("memberVo", memberVo);
			model.addAttribute("scrap", scrap);
			model.addAttribute("resumeCount", list.size());
						
			return "mypage/mypageHome";
			
		}else if(status.equals("C")) {
			logger.info("기업회원 마이페이지로 가자!");
			
			//기업회원 정보 구하기
			String cUserid = (String)session.getAttribute("userid");
			CompanyMemberVO comMemberVo = comMemberServ.selectCMemberInfoByUserid(cUserid);
			logger.info("comMemberVo={}", comMemberVo);
			
			//기업회원 년도 구하기
			String birth1 = comMemberVo.getcBirth();
			String birth = birth1.substring(0,2);
			logger.info("birth={}", birth);
			
			//기업 회원 기업 정보 구하기
			CompanyInfoVO comInfoVo = comInfoServ.selectComInfoBycMemberCode(comMemberVo.getcMemberCode());
			
			if(comInfoVo==null) {
				String msg = "회사정보를 입력해 주세요.", url="/companypage/companyHome.do";
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "common/message";
			}
			
			logger.info("기업회원 기업 정보, comInfoVo={}", comInfoVo);
			
			//기업회원 공고 정보 구하기
		
			List<Recruitment_TosVO> comRecuritTosListVo = comRecruitServ.selectList_tosByComcode(comInfoVo.getComCode());
			logger.info("기업회원 notice, comRecuritVo={}", comRecuritTosListVo);
			
			model.addAttribute("birth", birth);
			model.addAttribute("comMemberVo", comMemberVo);
			model.addAttribute("comInfoVo", comInfoVo);
			model.addAttribute("comRecuritListVo", comRecuritTosListVo);
			
			return "comMypage/comMypageHome";
		}
		
		return "/index";
	}
	
	@RequestMapping("/mypageScrap.do")
	public void mypageScrap(HttpSession session, Model model) {
		String userNo = (String)session.getAttribute("userNo");
		logger.info("나의 스크랩! userNo = {}", userNo);
		List<ComScrapVO> scrapList = comScrapServ.selectComScrapInfo(userNo);
		List<Recruitment_TosVO> list = comRecruitServ.selectScrapList(scrapList);
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/requestEmployment.do")
	public String requestEmployment(HttpSession session, Model model) {
		String userNo = (String)session.getAttribute("userNo");
		logger.info("입사요청 현황, userNo={}",userNo);
		
		List<Map<String,Object>> perList = resumeService.selectPerscrapByUserNo(userNo);
		logger.info("입사요청 현황, perList={}",perList);
		
		model.addAttribute("perList",perList);
		
		return "mypage/requestEmployment";
	}
}
