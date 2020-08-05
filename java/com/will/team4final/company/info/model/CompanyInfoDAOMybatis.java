package com.will.team4final.company.info.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyInfoDAOMybatis implements CompanyInfoDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.companyInfo.";

	@Override
	public int insertCompanyInfo(CompanyInfoVO vo) {
		return sqlSession.insert(namespace+"insertCompanyInfo", vo);
	}

	@Override
	public CompanyInfoVO selectComInfoBycMemberCode(String cMemberCode) {
		return sqlSession.selectOne(namespace+"selectComInfoBycMemberCode", cMemberCode );
	}
	
}
