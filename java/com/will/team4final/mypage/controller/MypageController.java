package com.will.team4final.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.company.model.Recruitment_TosVO;
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
	
	@RequestMapping("/mypageHome.do")
	public String mypage(@RequestParam String status, HttpSession session, Model model) {
		logger.info("어느 마이페이지를 가야할까!?");
		
		if(status.equals("U")) {
			logger.info("일반회원 마이페이지로 가자!");
			String userNo = (String)session.getAttribute("userNo");
			int scrap = comScrapServ.selectComScrapNum(userNo);
			
			List<ResumeVO> list = resumeService.selectResumeByUserNo(userNo);
			
			model.addAttribute("scrap", scrap);
			model.addAttribute("resumeCount", list.size());
						
			return "mypage/mypageHome";
			
		}else if(status.equals("C")) {
			logger.info("기업회원 마이페이지로 가자!");
			
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
}
