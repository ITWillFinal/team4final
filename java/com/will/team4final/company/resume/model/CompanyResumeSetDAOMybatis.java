package com.will.team4final.company.resume.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyResumeSetDAOMybatis implements CompanyResumeSetDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.companyResume.";

	@Override
	public int insertCompanyResumeSet(CompanyResumeSetVO companyResumeSetVo) {
		return sqlSession.insert(namespace+"insertCompanyResumeSet", companyResumeSetVo);
	}
	
	
}
