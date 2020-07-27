package com.will.team4final.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.team4final.notice.model.NoticeService;
import com.will.team4final.notice.model.NoticeVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	NoticeService noticeServ;
	
	@RequestMapping("/adminMain.do")
	public void adminMain() {
		logger.info("관리자 메인 홈!");
	}
	
	@RequestMapping("/adminNotice.do")
	public String adminNotice(Model model) {
		logger.info("공지사항 관리 페이지");
		
		List<NoticeVO> list = noticeServ.selectAllNotice();
		logger.info("공지사항 목록 개수 = {}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/adminNotice";
	}
	
	@RequestMapping(value = "/adminAddNotice.do", method = RequestMethod.GET)
	public String adminAddNotice_get() {
		logger.info("공지사항 등록 페이지");
		
		return "admin/adminAddNotice";
	}

	@RequestMapping(value = "/adminAddNotice.do", method = RequestMethod.POST)
	public String adminAddNotice_post(@ModelAttribute NoticeVO vo, Model model) {
		logger.info("공지사항 등록 처리 페이지, 파라미터 vo = {}", vo);
		vo.setFilename("");
		vo.setOriginfilename("");
		int cnt = noticeServ.insertNotice(vo);
		
		String url = "/admin/adminAddNotice.do", msg = "등록오류입니다.";
		if(cnt > 0) {
			url = "/admin/adminNotice.do";
			msg = "등록 완료되었습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
}
