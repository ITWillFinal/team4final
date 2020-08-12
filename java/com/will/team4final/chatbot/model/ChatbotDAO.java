package com.will.team4final.chatbot.model;

import java.util.List;

public interface ChatbotDAO {
	List<String> selectKeyword();
	String searchAnswer(String keyword);
}
