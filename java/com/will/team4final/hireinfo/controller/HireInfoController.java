package com.will.team4final.hireinfo.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.jobkinds.model.JobService;
import com.will.team4final.location.model.LocationService;
import com.will.team4final.login.controller.LoginController;

@Controller
@RequestMapping("/hireinpo")
public class HireInfoController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LocationService locationServ;
	@Autowired
	private JobService jobServ;
	@Autowired
	private ComRecruitService comRecuritServ;
	
	@RequestMapping("/hireinpo.do")
	public String hireinpoHome(Model model) {
		logger.info("채용정보 홈");
		
		List<String> locationList = locationServ.sido();
		List<Map<String, Object>> jobList = jobServ.selectLarge();
		List<Map<String, Object>> induList = jobServ.selectInduLarge();
		
		model.addAttribute("locationList", locationList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("induList", induList);
		
		return "hireinpo/hireinpo";
	}
	
	@RequestMapping("/infoDetail.do")
	public String infoDetail(@RequestParam String recruitmentCode, Model model) {
		logger.info("기업 채용 디테일, 파라미터 recruitmentCode = {}", recruitmentCode);
		
		ComRecruitVO vo = comRecuritServ.selectOneCom(recruitmentCode);
		logger.info("채용 vo = {}", vo);
		
		model.addAttribute("vo", vo);
		
		return "hireinpo/infoDetail";
	}
}
