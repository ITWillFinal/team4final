package com.will.team4final.company.model;

public interface ComMemberDAO {
	int insertCMember(CompanyMemberVO vo);
	int selectCMemberDup(String cUserid);
}
