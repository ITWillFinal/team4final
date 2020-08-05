package com.will.team4final.chart.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAOMybatis implements ChartDAO{
	
	@Autowired private SqlSessionTemplate sqlsession;
	
	private String namespace = "com.mybatis.mapper.oracle.chart.";

	@Override
	public int sumByMonth(String month) {
		return sqlsession.selectOne(namespace+"sumByMonth", month);
	}

	@Override
	public int countByMember(String month) {
		return sqlsession.selectOne(namespace+"countByMember", month);
	}

	@Override
	public int countByMemberC(String month) {
		return sqlsession.selectOne(namespace+"countByMemberC", month);
	}
	
	

}
