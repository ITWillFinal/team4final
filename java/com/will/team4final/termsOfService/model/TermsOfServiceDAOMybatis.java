package com.will.team4final.termsOfService.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TermsOfServiceDAOMybatis implements TermsOfServiceDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.tos.";

	@Override
	public int insertTOS(TermsOfServiceVO tosVo) {
		return sqlSession.insert(namespace+"insertTOS", tosVo);
	}

	@Override
	public TermsOfServiceVO selectByrecruitmentCode(String recruitmentCode) {
		return sqlSession.selectOne(namespace+"selectByrecruitmentCode",recruitmentCode);
	}
	
}
