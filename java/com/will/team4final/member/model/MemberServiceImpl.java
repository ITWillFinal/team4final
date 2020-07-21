package com.will.team4final.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO vo) {
		return memberDao.insertMember(vo);
	}

	@Override
	public int selectMemberDup(String userid) {
		return memberDao.selectMemberDup(userid);
	}

	@Override
	public String findId(String email) {
		return memberDao.findId(email);
	}

	@Override
	public int updatePwdByEmail(MemberVO memberVo) {
		return memberDao.updatePwdByEmail(memberVo);
	}

	@Override
	public MemberVO selectAll(String user_id) {
		return memberDao.selectAll(user_id);
	}
	

}
