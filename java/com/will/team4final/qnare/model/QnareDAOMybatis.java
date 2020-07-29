package com.will.team4final.qnare.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnareDAOMybatis implements QnareDAO{
	
	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace = "com.mybatis.mapper.oracle.qnare.";

	@Override
	public QnareVO selectRe(int qnaNo) {
		return sqlSession.selectOne(namespace+"selectRe", qnaNo);
	}

	@Override
	public int reCount(int qnaNo) {
		return sqlSession.selectOne(namespace+"reCount", qnaNo);
	}

	@Override
	public int replyWrite(QnareVO revo) {
		return sqlSession.insert(namespace+"replyWrite", revo);
	}

	@Override
	public int replyDel(int qnaNo) {
		return sqlSession.delete(namespace+"replyDel", qnaNo);
	}

	@Override
	public int replyEdit(QnareVO qnareVo) {
		return sqlSession.update(namespace+"replyEdit", qnareVo);
	}

	@Override
	public QnareVO selectByNo(int qnaNo) {
		return sqlSession.selectOne(namespace+"selectByNo",qnaNo);
	}
	

}
