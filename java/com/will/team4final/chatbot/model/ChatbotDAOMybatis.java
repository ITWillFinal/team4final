package com.will.team4final.chatbot.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatbotDAOMybatis implements ChatbotDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespase="com.will.team4final.chatbot.";
	
	@Override
	public List<String> selectKeyword() {
		return sqlSession.selectList(namespase+"selectKeyword");
	}
	
	@Override
	public String searchAnswer(String keyword) {
		return sqlSession.selectOne(namespase+"searchAnswer",keyword);
	}
	
	
}
