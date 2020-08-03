package com.will.team4final.chart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chartTest")
public class ChartConroller {
	
	private Logger logger
		= LoggerFactory.getLogger(ChartConroller.class);
	
	@RequestMapping("/charT.do")
	public void chartT() {
		logger.info("차트 보여주기");
	}
	
	@RequestMapping("/charP.do")
	public void chartP() {
		logger.info("차트 보여주기");
	}
	

}
