package com.will.team4final.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.payment.controller.ImportController;

@Controller
public class ImportController {

		private static final Logger logger = LoggerFactory.getLogger(ImportController.class);
		
		@RequestMapping("/import/import.do")
		public String showImport() {
			logger.info("임포트 페잉지 화면 보여지기");
			return "import/import";
		}
	}
