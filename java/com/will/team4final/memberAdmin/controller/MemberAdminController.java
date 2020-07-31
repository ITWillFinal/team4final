package com.will.team4final.memberAdmin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.memberAdmin.model.MemberAdminService;
import com.will.team4final.memberAdmin.model.MemberAdminVO;

@Controller
@RequestMapping("/memberAdmin")
public class MemberAdminController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(MemberAdminController.class);
	
	@Autowired private MemberAdminService memberAdminService;
	
	
	//관리자 로그인 화면
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login_get() {
		logger.info("관리자 로그인 화면 보여주기");
	}

	//관리자 회원가입 get
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public void register_get() {
		logger.info("관리자 회원가입 보여주기");
	}
	
	//관리자 회원가입 post
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register_post(@ModelAttribute MemberAdminVO vo, Model model) {
		logger.info("관리자 회원가입, 파라미터 memberAdminVo = {}", vo);
		
		int cnt = memberAdminService.insertAdmin(vo);
		logger.info("관리자 회원가입 결과, cnt = {}", cnt);
		String msg = "관리자 등록 실패", url = "/memberAdmin/register.do";
		if(cnt>0) {
			msg = "관리자 등록 성공!";
			url = "/admin/adminMain.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	//관리자 회원가입 - 아이디 중복체크
	@RequestMapping("/register/checkId.do")
	@ResponseBody
	public int selectIdDup(@RequestParam(required = false) String adminId) {
		logger.info("관리자 회원가입 - 아이디 중복체크, 파라미터 adminId = {}", adminId);
		
		int cnt = memberAdminService.selectIdDup(adminId);
		logger.info("관리자 회원가입 - 아이디 중복체크 결과 cnt = {}", cnt);
		
		return cnt;
	}
	
}
