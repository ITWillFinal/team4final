package com.will.team4final.memberAdmin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberAdminDAOMybatis implements MemberAdminDAO{
	
	@Autowired private SqlSessionTemplate sqlsession;
	
	private String namespace = "com.mybatis.mapper.oracle.memberAdmin.";

	@Override
	public int selectIdDup(String adminId) {
		return sqlsession.selectOne(namespace+"selectIdDup", adminId);
	}

	@Override
	public int insertAdmin(MemberAdminVO vo) {
		return sqlsession.insert(namespace+"insertAdmin", vo);
	}

	@Override
	public String selectMemberPwd(String adminId) {
		return sqlsession.selectOne(namespace+"selectMemberPwd", adminId);
	}

	@Override
	public MemberAdminVO selectByUserid(String adminId) {
		return sqlsession.selectOne(namespace+"selectByUserid", adminId);
	}

	@Override
	public String selectLevel(String adminId) {
		return sqlsession.selectOne(namespace+"selectLevel", adminId);
	}

}
