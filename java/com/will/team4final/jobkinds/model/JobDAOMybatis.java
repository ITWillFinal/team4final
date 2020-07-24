package com.will.team4final.jobkinds.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class JobDAOMybatis implements JobDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.will.team4final.jobkinds.";

	@Override
	public List<Map<String, Object>> selectLarge() {
		return sqlSession.selectList(namespace + "selectJobLarge");
	}

	@Override
	public List<Map<String, Object>> selectInduLarge() {
		return sqlSession.selectList(namespace + "selectInduLarge");
	}

	@Override
	public List<Map<String, Object>> selectJobMiddle(int no) {
		return sqlSession.selectList(namespace + "selectJobMiddle", no);
	}

	@Override
	public List<Map<String, Object>> selectInduMiddle(int no) {
		return sqlSession.selectList(namespace + "selectInduMiddle", no);
	}
	
	
}
