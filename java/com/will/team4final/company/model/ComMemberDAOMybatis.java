package com.will.team4final.company.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComMemberDAOMybatis implements ComMemberDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.cmember.";

	@Override
	public int insertCMember(CompanyMemberVO vo) {
		return sqlSession.insert(namespace + "insertCMember", vo);
	}

	@Override
	public int selectCMemberDup(String cUserid) {
		return sqlSession.selectOne(namespace + "selectCMemberDup", cUserid);
	}

	@Override
	public String findCMemberId(String cEmail) {
		return sqlSession.selectOne(namespace + "findCMemberId", cEmail);
	}

	@Override
	public int updateCMemberPwdByEmail(CompanyMemberVO companyMemberVo) {
		return sqlSession.update(namespace + "updateCMemberPwdByEmail", companyMemberVo);
	}

	@Override
	public CompanyMemberVO selectCMemberInfoByUserid(String cUserid) {
		return sqlSession.selectOne(namespace + "selectCMemberInfoByUserid", cUserid);
	}

	@Override
	public String selectCMemberPwd(String cUserid) {
		return sqlSession.selectOne(namespace + "selectCMemberPwd", cUserid);
	}

	@Override
	public CompanyMemberVO selectCMemberByUserCode(int userNo) {
		return sqlSession.selectOne(namespace+"selectCMemberByUserCode", userNo);
	}
}
