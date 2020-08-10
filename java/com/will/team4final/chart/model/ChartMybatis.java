package com.will.team4final.chart.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartMybatis implements ChartDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.will.team4final.chart.";

	@Override
	public int sumByMonth(String month) {
		return sqlSession.selectOne(namespace+"sumByMonth", month);
	}

	@Override
	public int countByMember(String month) {
		return sqlSession.selectOne(namespace+"countByMember", month);
	}

	@Override
	public int countByMemberC(String month) {
		return sqlSession.selectOne(namespace+"countByMemberC", month);
	}

	@Override
	public int countByGenderM() {
		return sqlSession.selectOne(namespace+"countByGenderM");
	}

	@Override
	public int countByGenderF() {
		return sqlSession.selectOne(namespace+"countByGenderF");
	}

	@Override
	public int countByAgeM(int age) {
		return sqlSession.selectOne(namespace+"countByAgeM", age);
	}

	@Override
	public int countByAgeF(int age) {
		return sqlSession.selectOne(namespace+"countByAgeF", age);
	}

	@Override
	public int countByAge(int age) {
		return sqlSession.selectOne(namespace+"countByAge", age);
	}

}
