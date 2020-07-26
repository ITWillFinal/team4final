package com.will.team4final.company.controller;

import java.util.List;

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

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.location.model.LocationService;
import com.will.team4final.location.model.LocationVO;
import com.will.team4final.login.controller.LoginController;

@Controller
@RequestMapping("/companypage")
public class CompanyHomeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired private ComMemberService cMemberSerice;
	
	@Autowired
	private LocationService locaServ;
	
	@RequestMapping("/companyHome.do")
	public String companyHome() {
		logger.info("기업페이지 홈");
		
		return "companypage/companyHome";
	}
	
	@RequestMapping("/member/companyJoin.do")
	public void companyJoin() {
		logger.info("기업회원가입 페이지");
		
	}
	
	@RequestMapping("/member/checkUserid.do")
	public String checkcUserid(@RequestParam String cUserid, Model model) {
		logger.info("기업회원 아이디 중복확인, 파라미터 cUserid={}", cUserid);
		if(cUserid==null || cUserid.isEmpty()) {
			return "companypage/member/checkUserid";
		}
		
		int result = cMemberSerice.selectCMemberDup(cUserid);
		
		logger.info("기업회원 아이디 중복확인 결과, result={}", result);
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID",ComMemberService.EXIST_ID);
		model.addAttribute("NON_EXIST_ID",ComMemberService.NON_EXIST_ID);

		return "companypage/member/checkUserid";
		
	}
	
	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String comRegister_post(@ModelAttribute CompanyMemberVO vo, Model model) {
		logger.info("기업회원 등록, 파라미터 vo={}", vo);
		
		int cnt = cMemberSerice.insertCMember(vo);
		logger.info("기업 회원 입력 결과 cnt={}", cnt);
		
		String msg="회원 가입 실패", url="/companypage/member/companyJoin.do";
		if(cnt>0) {
			msg="회원 가입 성공";
			url="/companypage/companyHome.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
	
	@RequestMapping("/companyWrite.do")
	public String companyWrite(Model model) {
		logger.info("기업페이지 채용공고등록");
		
		List<String> list = locaServ.sido();
		logger.info("지역 list = {}", list.size());
		
		model.addAttribute("list", list);
		return "companypage/companyWrite";
	}
	
	@RequestMapping("/companyResumeSet.do")
	public String resumeSet() {
		logger.info("기업페이지 자사 이력서양식 제작");
		
		return "companypage/companyResumeSet";
	}
	
	@RequestMapping("/companyResumeUse.do")
	public String resumeUse() {
		logger.info("기업페이지 자사 이력서양식 제작");
		
		return "companypage/companyResumeUse";
	}
	
	@RequestMapping("/companypage/member/register/checkId.do")
	@ResponseBody
	public int cMemberCheckId(@RequestParam String cUserid1) {
		logger.info("기업회원 아이디 체크");
		
		int cnt = cMemberSerice.selectCMemberDup(cUserid1);
		logger.info("기업회원 아아디 체크 결과, cnt={}", cnt);
		
		return cnt;
		
	}
	
}
