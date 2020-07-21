package com.will.team4final.company.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.location.model.LocationService;
import com.will.team4final.location.model.LocationVO;
import com.will.team4final.login.controller.LoginController;

@Controller
public class CompanyHomeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LocationService locaServ;
	
	@RequestMapping("/hireinpo/hireinpo.do")
	public String hireinpoHome() {
		logger.info("채용정보 홈");
		
		return "hireinpo/hireinpo";
	}
	
	@RequestMapping("/companypage/member/companyJoin.do")
	public void companyJoin() {
		logger.info("기업회원가입 페이지");
		
	}
	
	@RequestMapping("/companypage/companyWrite.do")
	public String companyWrite(Model model) {
		logger.info("기업페이지 채용공고등록");
		
		List<String> list = locaServ.sido();
		logger.info("지역 list = {}", list.size());
		
		List<LocationVO> allList = locaServ.selectAllLocation();
		logger.info("총 list = {}", allList.size());
		
		model.addAttribute("list", list);
		model.addAttribute("allList", allList);
		
		return "companypage/companyWrite";
	}
	
	@RequestMapping("/companypage/companyResume.do")
	public String resume() {
		logger.info("기업페이지 자사 이력서양식 제작");
		
		return "companypage/companyResume";
	}
	
	
	
	
}
