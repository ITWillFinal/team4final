package com.will.team4final.chart.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAOMybatis implements ChartDAO{
	
	@Autowired private SqlSessionTemplate sqlsession;
	
	private String namespace = "com.mybatis.mapper.oracle.chart.";

	@Override
	public String sumByMonth(String month) {
		return sqlsession.selectOne(namespace+"sumByMonth", month);
	}

	@Override
	public String countByMember(String month) {
		return sqlsession.selectOne(namespace+"countByMember", month);
	}

	@Override
	public String countByMemberC(String month) {
		return sqlsession.selectOne(namespace+"countByMemberC", month);
	}

	@Override
	public String countByGenderM() {
		return sqlsession.selectOne(namespace+"countByGenderM");
	}

	@Override
	public String countByGenderF() {
		return sqlsession.selectOne(namespace+"countByGenderF");
	}

	@Override
	public String countByAgeM(int age) {
		return sqlsession.selectOne(namespace+"countByAgeM", age);
	}

	@Override
	public String countByAgeF(int age) {
		return sqlsession.selectOne(namespace+"countByAgeF", age);
	}

	@Override
	public String countByAge(int age) {
		return sqlsession.selectOne(namespace+"countByAge", age);
	}
	
	

}
