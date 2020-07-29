package com.will.team4final.scrip.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.login.controller.LoginController;
import com.will.team4final.scrip.model.ComScrapService;
import com.will.team4final.scrip.model.ComScrapVO;

@Controller
@RequestMapping("/scrap")
public class ScrapController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private ComScrapService comScrapServ;
	
	
	@RequestMapping("/recruitScrap.do")
	@ResponseBody
	public int recruitScrap(@RequestParam String recruitmentCode, HttpSession session) {
		String userNo = (String)session.getAttribute("userNo");
		logger.info("채용정보 스크립트! recruitmentCode = {} userNo = {}", recruitmentCode, userNo);
		
		ComScrapVO comVo = new ComScrapVO();
		comVo.setRecruitmentCode(recruitmentCode);
		comVo.setUserNo(userNo);
		
		int com = comScrapServ.insertComScrap(comVo);
		
		int result = 1;
		if (com > 0) {
			result = 2;
		}
		
		return result;
	}
	
	@RequestMapping("/delRecruitScrap.do")
	@ResponseBody
	public int delRecruitScrap(@RequestParam String recruitmentCode, HttpSession session) {
		String userNo = (String)session.getAttribute("userNo");
		logger.info("채용정보 스크립트 삭제합니다. recruitmentCode = {} userNo = {}", recruitmentCode, userNo);
		
		ComScrapVO comVo = new ComScrapVO();
		comVo.setRecruitmentCode(recruitmentCode);
		comVo.setUserNo(userNo);
		
		int com = comScrapServ.deleteScrap(comVo);
		
		int result = 1;
		if (com > 0) {
			result = 2;
		}
		
		return result;
	}
}
