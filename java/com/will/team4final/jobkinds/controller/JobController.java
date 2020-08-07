package com.will.team4final.jobkinds.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.gogak.controller.FaqController;
import com.will.team4final.jobkinds.model.JobService;

@Controller
@RequestMapping("/job")
public class JobController {
	private final static Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private JobService jobServ;
	
	@RequestMapping("/jobMiddle.do")
	@ResponseBody
	public List<Map<String, Object>> jobMiddle(@RequestParam(defaultValue = "0") int no) {
		logger.info("잡미들 에이젝스!");
		
		List<Map<String, Object>> middleList = jobServ.selectJobMiddle(no);
		logger.info("잡미들 사이즈 = {}", middleList.size());
		
		
		return middleList;
	}
	
	@RequestMapping("/induMiddle.do")
	@ResponseBody
	public List<Map<String, Object>> induMiddle(@RequestParam(defaultValue = "0") int no) {
		logger.info("인더미들 에이젝스!");
		
		List<Map<String, Object>> middleList = jobServ.selectInduMiddle(no);
		logger.info("인더미들 사이즈 = {}", middleList.size());
		
		return middleList;
	}
}
