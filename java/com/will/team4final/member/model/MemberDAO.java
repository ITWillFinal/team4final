package com.will.team4final.member.model;

public interface MemberDAO {
	
	int insertMember(MemberVO vo);
	int selectMemberDup(String userid);
}
