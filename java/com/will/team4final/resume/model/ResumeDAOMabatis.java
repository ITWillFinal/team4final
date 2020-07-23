package com.will.team4final.resume.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOMabatis implements ResumeDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
}
