package com.will.team4final.company.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;

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

	@Override
	public List<CompanyMemberVO> showAllCMember(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"showAllCMember", searchVo );
	}

	@Override
	public int selectTotalRecordOfCMember(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordOfCMember", searchVo);
	}
}
