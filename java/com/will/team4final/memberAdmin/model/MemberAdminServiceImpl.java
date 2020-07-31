package com.will.team4final.memberAdmin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberAdminServiceImpl implements MemberAdminService{
	
	@Autowired MemberAdminDAO memberAdminDao;

	@Override
	public int selectIdDup(String adminId) {
		return memberAdminDao.selectIdDup(adminId);
	}

	@Override
	public int insertAdmin(MemberAdminVO vo) {
		return memberAdminDao.insertAdmin(vo);
	}

	@Override
	public int loginCheck(String adminId, String pwd) {
		int result = 0;
		
		int idCheck = memberAdminDao.selectIdDup(adminId);
		if(idCheck>0) {
			String pwdCheck = memberAdminDao.selectMemberPwd(adminId);
			if(memberAdminDao.selectLevel(adminId)==null
					|| memberAdminDao.selectLevel(adminId).isEmpty()) {
				result = NO_LEVEL;
			}else if(pwd.equals(pwdCheck)) {
				result = LOGIN_OK;
			}else if(!pwd.equals(pwdCheck)) {
				result = PWD_DISAGREE;
			}
		}else {
			result = ID_NONE;
		}
		
		return result;
	}

	@Override
	public MemberAdminVO selectByUserid(String adminId) {
		return memberAdminDao.selectByUserid(adminId);
	}


}
