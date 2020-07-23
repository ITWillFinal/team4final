package com.will.team4final.location.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.location.model.LocationService;

@Controller
public class LocationController {
	private static final Logger logger = LoggerFactory.getLogger(LocationController.class);
	
	@Autowired
	private LocationService locationServ;
	
	@RequestMapping(value = "/sigugun.do")
	@ResponseBody
	public List<String> ajaxTest(@RequestParam String sido) {
		logger.info("시구군 구해보자! 파라미터 sido = {}", sido);
		  
		List<String> sigugunList = locationServ.selectSigugun(sido);
		logger.info("list사이즈 = {}", sigugunList.size());
	      
		return sigugunList;
   }
}
