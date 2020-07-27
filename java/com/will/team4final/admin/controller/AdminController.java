package com.will.team4final.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired private MemberService memberService;
	
	@RequestMapping("/adminMain.do")
	public void adminMain() {
		logger.info("관리자 메인 홈!");
	}
	
	@RequestMapping("/adminNotice.do")
	public String adminNotice() {
		logger.info("공지사항 관리 페이지");
		
		return "admin/adminNotice";
	}
	
	@RequestMapping("/adminAddNotice.do")
	public String adminAddNotice() {
		logger.info("공지사항 등록 페이지");
		
		return "admin/adminAddNotice";
	}
	
	@RequestMapping("/adminMemberManagement.do")
	public String adminMemberManagement(@ModelAttribute DateSearchVO dateSearchVo, Model model) {
		logger.info("공지사항 등록 페이지");
		
		List<MemberVO> memberList = memberService.showAllMemberUser();
		
		
		
		model.addAttribute("memberList", memberList);
		
		return "admin/adminMemberManagement";
	}

}
