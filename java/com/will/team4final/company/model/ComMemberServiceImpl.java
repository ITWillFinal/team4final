package com.will.team4final.company.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComMemberServiceImpl implements ComMemberService{
	@Autowired private ComMemberDAO comMemberDao;

	@Override
	public int insertCMember(CompanyMemberVO vo) {
		return comMemberDao.insertCMember(vo);
	}

	@Override
	public int selectCMemberDup(String cUserid) {
		int cnt = comMemberDao.selectCMemberDup(cUserid);
		System.out.println("아이디 중복 체크 결과. cnt= "+ cnt);
		int result=0;
		if(cnt>0) {
			result=EXIST_ID;
		}else {
			result=NON_EXIST_ID;
		}
		return result;
	}

	@Override
	public String findCMemberId(String cEmail) {
		return comMemberDao.findCMemberId(cEmail);
	}

	@Override
	public int updateCMemberPwdByEmail(CompanyMemberVO companyMemberVo) {
		return comMemberDao.updateCMemberPwdByEmail(companyMemberVo);
	}

	@Override
	public CompanyMemberVO selectCMemberInfoByUserid(String cUserid) {
		return comMemberDao.selectCMemberInfoByUserid(cUserid);
	}

	@Override
	public int comLoginCheck(String userid, String pwd) {
		int idCheck = comMemberDao.selectCMemberDup(userid);
		
		int result = 0;
		
		if(idCheck > 0) {
			String pwdCheck = comMemberDao.selectCMemberPwd(userid);
			if(pwd.equals(pwdCheck)) {
				result = ComMemberService.LOGIN_OK;
			}else {
				result = ComMemberService.PWD_DISAGREE;
			}
		}else{
			result = ComMemberService.ID_NONE;
		}
		
		return result;
	}
	
	

}
