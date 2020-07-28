package com.will.team4final.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.will.team4final.notice.model.NoticeService;

@Controller
public class NoticeController {
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeServ;
	
	public String noticeDetail() {
		
	}
}
