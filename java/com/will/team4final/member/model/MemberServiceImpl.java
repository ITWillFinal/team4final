package com.will.team4final.member.model;

import java.util.List;

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
	public MemberVO selectByUserid(String user_id) {
		return memberDao.selectByUserid(user_id);
	}

	@Override
	public int loginCheck(String userid, String pwd) {
		int result = 0;
		int idCheck = memberDao.selectMemberDup(userid);
		if(idCheck > 0) {
			String pwdCheck = memberDao.selectMemberPwd(userid);
			if(pwd.equals(pwdCheck)) {
				result = MemberService.LOGIN_OK;
			}else {
				result = MemberService.PWD_DISAGREE;
			}
		}else{
			result = MemberService.ID_NONE;
		}
		
		return result;
	}

	@Override
	public List<MemberVO> showAllMemberUser() {
		return memberDao.showAllMemberUser();
	}

	@Override
	public int deleteUser(int userNo) {
		return memberDao.deleteUser(userNo);
	}

	@Override
	public MemberVO selectByUerNo(int userNo) {
		return memberDao.selectByUerNo(userNo);
	}
	
	
}
