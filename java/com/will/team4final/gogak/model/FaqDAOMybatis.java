package com.will.team4final.gogak.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOMybatis implements FaqDAO{
	
	@Autowired private SqlSessionTemplate sqlsesseion;

	private String namespace = "com.mybatis.mapper.oracle.faq.";
	
	@Override
	public List<FaqVO> selectFaq() {
		return sqlsesseion.selectList(namespace+"selectFaq");
	}

	@Override
	public int WriteFaq(FaqVO vo) {
		return sqlsesseion.insert(namespace+"WriteFaq", vo);
	}

	@Override
	public FaqVO selectByNo(int no) {
		return sqlsesseion.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int editFaq(FaqVO vo) {
		return sqlsesseion.update(namespace+"editFaq", vo);
	}

	@Override
	public int deleteFaq(int no) {
		return sqlsesseion.delete(namespace+"deleteFaq", no);
	}
	
	

}
