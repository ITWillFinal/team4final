package com.will.team4final.Gogak;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GogakController {

	private final static Logger logger
		= LoggerFactory.getLogger(GogakController.class);
	
	@RequestMapping("/Gogak/faq.do")
	public String gogak_get() {
		logger.info("고객센터 창 보여주기");
		
		return "Gogak/faq";
	}
	
	
}
