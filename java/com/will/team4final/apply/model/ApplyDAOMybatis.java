package com.will.team4final.apply.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDAOMybatis implements ApplyDAO{
	private String namespace = "com.will.team4final.apply.";
	@Autowired private SqlSessionTemplate sqlSession;

	@Override
	public int insertApply(ApplyVO applyVo) {
		return sqlSession.insert(namespace+"insertApply",applyVo);
	}

	@Override
	public int selectApply(ApplyVO applyVo) {
		return sqlSession.selectOne(namespace+"selectApply",applyVo);
	}

	@Override
	public int deleteApply(String applyCode) {
		return sqlSession.delete(namespace+"deleteApply", applyCode);
	}

	@Override
	public List<Map<String, Object>> selectApplyForCompany(String recruitmentCode) {
		return sqlSession.selectList(namespace+"selectApplyForCompany",recruitmentCode);
	}

}
