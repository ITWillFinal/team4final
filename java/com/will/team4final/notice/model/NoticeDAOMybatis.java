package com.will.team4final.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoticeDAOMybatis implements NoticeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.will.team4final.notice.";
	
	public int insertNotice(NoticeVO vo) {
		return sqlSession.insert(namespace + "insertNotice", vo);
	}
	

}
