package com.will.team4final.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;
import com.will.team4final.member.model.MemberVO;

@Repository
public class AdminDAOMybatis implements AdminDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.admin.";

	@Override
	public List<MemberVO> adminShowAllMember(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"adminShowAllMember", searchVo);
	}

	@Override
	public int selectTotalRecordOfAdmin(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordOfAdmin", searchVo );
	}
	
}
