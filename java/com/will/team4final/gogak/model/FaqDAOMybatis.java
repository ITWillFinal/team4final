package com.will.team4final.gogak.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;

@Repository
public class FaqDAOMybatis implements FaqDAO{
	
	@Autowired private SqlSessionTemplate sqlsesseion;

	private String namespace = "com.mybatis.mapper.oracle.faq.";
	
	@Override
	public List<FaqVO> selectFaq(SearchVO searchVo) {
		return sqlsesseion.selectList(namespace+"selectFaq", searchVo);
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

	@Override
	public int selectTotalRecord(SearchVO vo) {
		return sqlsesseion.selectOne(namespace+"selectTotalRecord", vo);
	}

	@Override
	public FaqVO before(int faqNo) {
		return sqlsesseion.selectOne(namespace+"before", faqNo);
	}

	@Override
	public FaqVO after(int faqNo) {
		return sqlsesseion.selectOne(namespace+"after", faqNo);
	}
	
	

}
