package com.will.team4final.scrip.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ComScrapDAOMybatis implements ComScrapDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.will.team4final.scrap.";

	@Override
	public int insertComScrap(ComScrapVO comVo) {
		return sqlSession.insert(namespace + "insertComScrap", comVo);
	}

	@Override
	public int selectComScrapById(ComScrapVO comVo) {
		return sqlSession.selectOne(namespace + "selectComScrapById", comVo);
	}

	@Override
	public int deleteScrap(ComScrapVO comVo) {
		return sqlSession.delete(namespace + "deleteScrap", comVo);
	}

	@Override
	public int selectComScrapNum(String userNo) {
		return sqlSession.selectOne(namespace + "selectComScrapNum", userNo);
	}

	@Override
	public List<ComScrapVO> selectComScrapInfo(String userNo) {
		return sqlSession.selectList(namespace + "selectComScrapInfo", userNo);
	}
	

}
