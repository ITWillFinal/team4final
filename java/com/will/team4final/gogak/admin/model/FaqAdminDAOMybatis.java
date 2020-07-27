package com.will.team4final.gogak.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;

@Repository
public class FaqAdminDAOMybatis implements FaqAdminDAO{
	
	@Autowired private SqlSessionTemplate sqlsesseion;

	private String namespace = "com.mybatis.mapper.oracle.faqAdmin.";
	
	@Override
	public List<FaqAdminVO> selectFaq(SearchVO searchVo) {
		return sqlsesseion.selectList(namespace+"selectFaq", searchVo);
	}

	@Override
	public int WriteFaq(FaqAdminVO vo) {
		return sqlsesseion.insert(namespace+"WriteFaq", vo);
	}

	@Override
	public FaqAdminVO selectByNo(int no) {
		return sqlsesseion.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int editFaq(FaqAdminVO vo) {
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
	public FaqAdminVO before(int faqNo) {
		return sqlsesseion.selectOne(namespace+"before", faqNo);
	}

	@Override
	public FaqAdminVO after(int faqNo) {
		return sqlsesseion.selectOne(namespace+"after", faqNo);
	}
	
	

}
