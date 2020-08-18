package com.will.team4final.member.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.team4final.apply.model.ApplyVO;
import com.will.team4final.common.SearchVO;

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
	public List<MemberVO> showAllMemberUser(SearchVO searchVo) {
		return memberDao.showAllMemberUser(searchVo);
	}

	@Override
	public int deleteUser(String userNo) {
		return memberDao.deleteUser(userNo);
	}

	@Override
	public MemberVO selectByUerNo(String userNo) {
		return memberDao.selectByUerNo(userNo);
	}

	@Override
	public int changeResumeNo(MemberVO memberVo) {
		return memberDao.changeResumeNo(memberVo);
	}

	@Override
	public int changeYorn(MemberVO memberVo) {
		return memberDao.changeYorn(memberVo);
	}
	
	public int selectTotalRecordOfMember(SearchVO searchVo) {
		return memberDao.selectTotalRecordOfMember(searchVo);
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		return memberDao.updateMember(memberVo);
	}

	@Override
	public List<MemberVO> showMemberForExcel() {
		return memberDao.showMemberForExcel();
	}

	@Override
	public List<ApplyVO> selectApplyByuserNo(String userNo) {
		return memberDao.selectApplyByuserNo(userNo);
	}

	@Override
	public String selectMemberPwd(String userid) {
		return memberDao.selectMemberPwd(userid);
	}
}
