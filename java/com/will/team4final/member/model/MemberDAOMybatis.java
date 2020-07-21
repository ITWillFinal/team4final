package com.will.team4final.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.member.";

	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert(namespace+"insertMember", vo);
	}

	@Override
	public int selectMemberDup(String userid) {
		return sqlSession.selectOne(namespace + "selectMemberDup", userid);
	}

	@Override
	public String findId(String email) {
		return sqlSession.selectOne(namespace + "findId", email);
	}
	
	

}
