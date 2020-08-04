package com.will.team4final.memberAdmin.controller;

import java.util.List;
import java.util.Map;

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

import com.will.team4final.common.PaginationInfo;
import com.will.team4final.common.SearchVO;
import com.will.team4final.common.Utility;
import com.will.team4final.memberAdmin.model.MemberAdminService;
import com.will.team4final.memberAdmin.model.MemberAdminVO;
import com.will.team4final.memberAdmin.model.memberAdminListVO;

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
	
	@RequestMapping("/setLevel.do")
	public void setlevel(@RequestParam (defaultValue = "0") int adminNo, 
			@RequestParam (defaultValue = "0") int levels) {
		logger.info("adminNo={}, levels={}", adminNo, levels);
		
		
	}
	
	@RequestMapping("/adminInfo.do")
	public String pdList(@ModelAttribute SearchVO searchVo,
			Model model) {
		//1
		logger.info("관리자 목록 목록, 파라미터 searchVo={}", searchVo);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] SearchVo 에 값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());
		
		//2
		List<MemberAdminVO> list = memberAdminService.selectInfo(searchVo);
		logger.info("관리자 목록 개수, list.size={}", list.size());
		
		int totalRecord = memberAdminService.selectTotalRecord(searchVo);
		logger.info("관리자 목록, 전체 레코드 개수 totalRecord = {}",totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "memberAdmin/adminList";
	}
	
	@RequestMapping("/deleteMulti.do")
	public String delMulti(@ModelAttribute memberAdminListVO listvo,
			Model model) {
		logger.info("선택 게시글 삭제, 파라미터 faqvo={}", listvo);
		
		List<MemberAdminVO>list = listvo.getMalist();
		
		int cnt = memberAdminService.deleteMulti(list);
		logger.info("선택한 관리자 삭제 결과 cnt = {}", cnt);
		String msg = "", url = "/memberAdmin/adminInfo.do";
		if(cnt>0) {
			msg = "선택한 관리자를 삭제했습니다.";
			
			for(int i=0 ; i<list.size() ; i++) {
				MemberAdminVO vo = list.get(i);
				logger.info("i={}", i);
				logger.info("fnqNO={}", vo.getAdminNo());
			}//for
		}else {
			msg = "선택한 관리자 삭제 실패! 에러 발생!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("updateMulti.do")
	public String updateMulti(@RequestParam (defaultValue = "0") int adminNo,
			@RequestParam (defaultValue = "0") int level, Model model) {
		logger.info("파라미터 adminNo={}, level = {}", adminNo, level);
		
		MemberAdminVO vo = memberAdminService.selectByNO(adminNo);
		logger.info("vo={}", vo);
		
		vo.setLevels(level);
		int cnt = memberAdminService.updateLevel(vo);
		logger.info("cnt={}", cnt);
		
		String msg = "선택한 관리자의 권한을 변경하는 중 에러 발생", 
				url = "/memberAdmin/adminInfo.do";
		if(cnt>0) {
			msg = "선택한 관리자의 권한을 병경했습니다..";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
}



















