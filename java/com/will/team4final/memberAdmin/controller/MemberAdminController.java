package com.will.team4final.memberAdmin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			url = "/memberAdmin/login.do";
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

	
	//관리자 로그인
	@RequestMapping("/adminlogin.do")
	public String adminLogin(@RequestParam String adminId, @RequestParam String pwd,
			HttpServletRequest request, Model model) {
		logger.info("관리자 로그인 adminId = {}, pwd = {}", adminId, pwd);
		
		int cnt = memberAdminService.loginCheck(adminId, pwd);
		logger.info("로그인 결과, cnt = {}", cnt);
		
		String msg = "로그인 실패! \n오류가 발생했습니다!", url = "/memberAdmin/login.do";
		if(cnt == MemberAdminService.LOGIN_OK) {
			MemberAdminVO vo = memberAdminService.selectByUserid(adminId);
				msg = vo.getAdminName()+"관리자님 환영합니다.";
				url = "/admin/adminMain.do";
				
				HttpSession sesssion = request.getSession();
				sesssion.setAttribute("adminId", adminId);
				sesssion.setAttribute("adminName", vo.getAdminName());
				sesssion.setAttribute("levels", vo.getLevels());
		}else if(cnt == MemberAdminService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다.";
		}else if(cnt == MemberAdminService.ID_NONE) {
			msg = "존재하지 않는 관리자 ID입니다.";
		}else if(cnt == MemberAdminService.NO_LEVEL) {
			msg = "관리자 권한이 없습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
