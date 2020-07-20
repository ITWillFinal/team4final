package com.will.team4final.gogak;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gogak")
public class GogakController {
	private static final Logger logger
		= LoggerFactory.getLogger(GogakController.class);
	
	@RequestMapping()
	public String gogak_get() {
		
	}
	
}
