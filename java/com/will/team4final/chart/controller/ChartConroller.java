package com.will.team4final.chart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.chart.model.CalendarVO;
import com.will.team4final.chart.model.ChartService;

@Controller
@RequestMapping("/chartTest")
public class ChartConroller {
	
	private Logger logger
		= LoggerFactory.getLogger(ChartConroller.class);
	
	@Autowired ChartService chartService;
	
	@RequestMapping("/charT.do")
	public void chartT() {
		logger.info("차트 보여주기");
	}
	
	@RequestMapping("/charP.do")
	public void chartP() {
		logger.info("차트 보여주기");
	}
	
	/*
	@RequestMapping("/charL.do")
	public String chartL(Model model) {
		logger.info("차트 보여주기");
		
		CalendarVO vo = new CalendarVO();
		
		int month01 =  chartService.sumByMonth(vo.getMonth01());
		int month02 =  chartService.sumByMonth("-02-");
		int month03 =  chartService.sumByMonth("-03-");
		int month04 =  chartService.sumByMonth("-04-");
		int month05 =  chartService.sumByMonth("-05-");
		int month06 =  chartService.sumByMonth("-06-");
		int month07 =  chartService.sumByMonth("-07-");
		int month08 =  chartService.sumByMonth("-08-");
		int month09 =  chartService.sumByMonth("-09-");
		int month10 =  chartService.sumByMonth("-10-");
		int month11 =  chartService.sumByMonth("-11-");
		int month12 =  chartService.sumByMonth("-12-");
		
		logger.info("8월 판매량={}", month08);
		
		model.addAttribute("month01", month01);
		model.addAttribute("month02", month02);
		model.addAttribute("month03", month03);
		model.addAttribute("month04", month04);
		model.addAttribute("month05", month05);
		model.addAttribute("month06", month06);
		model.addAttribute("month07", month07);
		model.addAttribute("month08", month08);
		model.addAttribute("month09", month09);
		model.addAttribute("month10", month10);
		model.addAttribute("month11", month11);
		model.addAttribute("month12", month12);
		
		return "chartTest/chartL";
		
	}
	*/

}
