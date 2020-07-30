package com.will.team4final.qna.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;

@Repository
public class QnaDAOMybatis implements QnaDAO{
	
	@Autowired private SqlSessionTemplate sqlsession;
	
	private String namespace = "com.mybatis.mapper.oracle.qna.";

	@Override
	public List<QnaVO> selectQna(SearchVO searchVo) {
		return sqlsession.selectList(namespace+"selectQna", searchVo);
	}

	@Override
	public int WriteQna(QnaVO qnavo) {
		return sqlsession.insert(namespace+"WriteQna", qnavo);
	}

	@Override
	public int selectTotalRecord(SearchVO vo) {
		return sqlsession.selectOne(namespace+"selectTotalRecord", vo);
	}

	@Override
	public int editQna(QnaVO vo) {
		return sqlsession.update(namespace+"editQna", vo);
	}

	@Override
	public int deleteQna(int no) {
		return sqlsession.delete(namespace+"deleteQna", no);
	}

	@Override
	public QnaVO before(int qnaNo) {
		return sqlsession.selectOne(namespace+"before", qnaNo);
	}

	@Override
	public QnaVO after(int qnaNo) {
		return sqlsession.selectOne(namespace+"after", qnaNo);
	}

	@Override
	public QnaVO selectByNo(int no) {
		return sqlsession.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int countJoin() {
		return sqlsession.selectOne(namespace+"countJoin");
	}

	@Override
	public int countQna() {
		return sqlsession.selectOne(namespace+"countQna");
	}
	
	

	
}
