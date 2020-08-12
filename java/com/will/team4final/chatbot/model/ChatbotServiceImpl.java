package com.will.team4final.chatbot.model;

import java.util.List;

import org.apache.commons.math3.util.KthSelector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatbotServiceImpl implements ChatbotService{

	@Autowired private ChatbotDAO chatbotDao;

	@Override
	public String receiveMessage(String message) {
		String trimMessage = message.replaceAll(" ", "");
		String result = "죄송해요. <br>다시 말씀해 주시겠어요?";
		
		List<String> keywordList = chatbotDao.selectKeyword();
		
		for(int i=0; i<keywordList.size();i++) {
			String keyword = keywordList.get(i);
			
			if(trimMessage.indexOf(keyword)>=0) {
				result = chatbotDao.searchAnswer(keyword);
				break;
			}
		}
		
		return result;
	}
}
