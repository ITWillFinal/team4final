package com.will.team4final.company.model;

public interface ComMemberDAO {
	int insertCMember(CompanyMemberVO vo);
	int selectCMemberDup(String cUserid);
	String findCMemberId(String cEmail);
	int updateCMemberPwdByEmail(CompanyMemberVO companyMemberVo);
	CompanyMemberVO selectCMemberAll(String cUserid);
}
