package com.will.team4final.company.resume.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyResumeUseDAOMybatis implements CompanyResumeUseDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.companyResume.";

	@Override
	public int insertCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo) {
		return sqlSession.insert(namespace+"insertCompanyResumeUse", companyResumeUseVo);
	}

}
