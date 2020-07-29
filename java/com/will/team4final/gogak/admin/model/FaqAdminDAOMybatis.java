package com.will.team4final.gogak.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;

@Repository
public class FaqAdminDAOMybatis implements FaqAdminDAO{
	
	@Autowired private SqlSessionTemplate sqlsession;

	private String namespace = "com.mybatis.mapper.oracle.faqAdmin.";
	
	@Override
	public List<FaqAdminVO> selectFaq(SearchVO searchVo) {
		return sqlsession.selectList(namespace+"selectFaq", searchVo);
	}

	@Override
	public int WriteFaq(FaqAdminVO vo) {
		return sqlsession.insert(namespace+"WriteFaq", vo);
	}

	@Override
	public FaqAdminVO selectByNo(int no) {
		return sqlsession.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int editFaq(FaqAdminVO vo) {
		return sqlsession.update(namespace+"editFaq", vo);
	}

	@Override
	public int deleteFaq(int no) {
		return sqlsession.delete(namespace+"deleteFaq", no);
	}

	@Override
	public int selectTotalRecord(SearchVO vo) {
		return sqlsession.selectOne(namespace+"selectTotalRecord", vo);
	}

	@Override
	public FaqAdminVO before(int faqNo) {
		return sqlsession.selectOne(namespace+"before", faqNo);
	}

	@Override
	public FaqAdminVO after(int faqNo) {
		return sqlsession.selectOne(namespace+"after", faqNo);
	}
	
	

}
