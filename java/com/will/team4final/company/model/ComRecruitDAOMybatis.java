package com.will.team4final.company.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComRecruitDAOMybatis implements ComRecruitDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.companyRecruit.";
	
	@Override
	public int insertComRecruit(ComRecruitVO comRecruitVo) {
		return sqlSession.insert(namespace + "insertComRecruit", comRecruitVo);
	}
	
	
}
