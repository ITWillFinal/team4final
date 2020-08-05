package com.will.team4final.chart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.chart.model.ChartService;

@Controller
@RequestMapping("/chart")
public class ChartConroller {
	
	private Logger logger
		= LoggerFactory.getLogger(ChartConroller.class);
	
	@Autowired ChartService chartService;
		
	@RequestMapping("/priceByMonth.do")
	public void priceByMonth(Model model) {
		logger.info("차트 보여주기");
		
		/*
		List<Integer> monthList = new ArrayList<Integer>();
		
		for(int i=1 ; i<13 ; i++) {
			String month = "";
			if(i<10) {
				month="0"+i;
			}else {
				month=Integer.toString(i);
			}
			int sum = chartService.sumByMonth(month);
			
			logger.info("{}달 판매금액={}", month, sum);
			
			monthList.add(sum);
		}
		*/
		
		/*
		Map<Integer, Integer> list = new HashMap<Integer, Integer>();
		
		for(int i=1 ; i<13 ; i++) {
			int month = 0;
			if(i<13) {
				month=i;
			}
			int sum = chartService.sumByMonth(month);
			
			logger.info("{}달 판매금액={}", month, sum);
			
			list.put(month, sum);
		}
		 */
		int snum1 = chartService.sumByMonth("01");
		int snum2 = chartService.sumByMonth("02");
		int snum3 = chartService.sumByMonth("03");
		int snum4 = chartService.sumByMonth("04");
		int snum5 = chartService.sumByMonth("05");
		int snum6 = chartService.sumByMonth("06");
		int snum7 = chartService.sumByMonth("07");
		int snum8 = chartService.sumByMonth("08");
		int snum9 = chartService.sumByMonth("09");
		int snum10 = chartService.sumByMonth("10");
		int snum11 = chartService.sumByMonth("11");
		int snum12 = chartService.sumByMonth("12");
		
		logger.info("1월 매출={}", snum1);
		logger.info("2월 매출={}", snum2);
		logger.info("3월 매출={}", snum3);
		logger.info("4월 매출={}", snum4);
		logger.info("5월 매출={}", snum5);
		logger.info("6월 매출={}", snum6);
		logger.info("7월 매출={}", snum7);
		logger.info("8월 매출={}", snum8);
		logger.info("9월 매출={}", snum9);
		logger.info("10월 매출={}", snum10);
		logger.info("11월 매출={}", snum11);
		logger.info("12월 매출={}", snum12);
		
		model.addAttribute("snum1", snum1);
		model.addAttribute("snum2", snum2);
		model.addAttribute("snum3", snum3);
		model.addAttribute("snum4", snum4);
		model.addAttribute("snum5", snum5);
		model.addAttribute("snum6", snum6);
		model.addAttribute("snum7", snum7);
		model.addAttribute("snum8", snum8);
		model.addAttribute("snum9", snum9);
		model.addAttribute("snum10", snum10);
		model.addAttribute("snum11", snum11);
		model.addAttribute("snum12", snum12);
		
	}
	

}
