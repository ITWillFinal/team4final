package com.will.team4final.chatbot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.chatbot.model.ChatbotService;

@Controller
@RequestMapping("/chatbot")
public class ChatbotController {
	private Logger logger = LoggerFactory.getLogger(ChatbotController.class);
	@Autowired private ChatbotService chatbotService;
	
	@ResponseBody
	@RequestMapping(value = "/messageSend.do", produces = "application/text; charset=utf8")
	public String messageSend(@RequestParam String message) {
		logger.info("잡잡이 받은 메세지 message={}",message);
		String result = chatbotService.receiveMessage(message);
		
		return result;
	}
}
