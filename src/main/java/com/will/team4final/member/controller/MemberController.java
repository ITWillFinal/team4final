package com.will.team4final.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.common.FileUploadUtil;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private MemberService memberService;
	
	
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public void memberRegister_get() {
		logger.info("개인회원 등록 화면");

	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String memberRegister_post(@ModelAttribute MemberVO vo,HttpServletRequest request ,Model model) {
		logger.info("개인회원 등록, 파라미터 vo={}", vo);
		//파일 업로드 처리
		List<Map<String, Object>> fileList
		=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PERSONAL_IMAGE);

		String imageURL="";
		for(Map<String, Object> map : fileList) {
			imageURL=(String) map.get("fileName");
		}
		vo.setImageURL(imageURL);
		
		int cnt = memberService.insertMember(vo);
		logger.info("개인 회원 입력 결과 cnt={}", cnt);
		String msg="회원 가입 실패", url="/member/register.do";
		if(cnt>0) {
			msg="회원 가입 성공";
			url="/login/login.do";
		}
		
		return "common/message";
	}
	
	@RequestMapping("/checkUserid.do")
	public String chkUserid(@RequestParam String userid, Model model) {
		logger.info("개인회원 아이디 중복확인, 파라미터  userid={}", userid);
		if(userid==null || userid.isEmpty()) {
			return "member/checkUserid";
		}
		
		int result = memberService.selectMemberDup(userid);
		logger.info("개인회원 아이디 중복확인 결과, result={}", result);
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID",MemberService.EXIST_ID);
		model.addAttribute("NON_EXIST_ID",MemberService.NON_EXIST_ID);
		
		return "member/checkUserid";
	}
	
	
}
