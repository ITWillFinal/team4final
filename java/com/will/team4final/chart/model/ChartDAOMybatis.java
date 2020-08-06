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

	@Override
	public int countByGenderM() {
		return sqlsession.selectOne(namespace+"countByGenderM");
	}

	@Override
	public int countByGenderF() {
		return sqlsession.selectOne(namespace+"countByGenderF");
	}

	@Override
	public int countByAgeM(int age) {
		return sqlsession.selectOne(namespace+"countByAgeM", age);
	}

	@Override
	public int countByAgeF(int age) {
		return sqlsession.selectOne(namespace+"countByAgeF", age);
	}

	@Override
	public int countByAge(int age) {
		return sqlsession.selectOne(namespace+"countByAge", age);
	}
	
	

}
