package com.will.team4final.location.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocationDAOMybatis implements LocationDAO{
	
	private String namespace = "com.will.team4final.location.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<String> sido() {
		return sqlSession.selectList(namespace + "selectSido");
	}

	@Override
	public List<LocationVO> selectAllLocation() {
		return sqlSession.selectList(namespace + "selectAllLocation");
	}

	@Override
	public List<String> selectSigugun(String sido) {
		return sqlSession.selectList(namespace + "selectSigugun", sido);
	}
	
	
}
