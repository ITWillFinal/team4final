package com.will.team4final.company.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.team4final.common.SearchVO;

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
		
		return cnt;
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

	@Override
	public CompanyMemberVO selectCMemberByUserCode(String userNo) {
		return comMemberDao.selectCMemberByUserCode(userNo);
	}

	@Override
	public List<CompanyMemberVO> showAllCMember(SearchVO searchVo) {
		return comMemberDao.showAllCMember(searchVo);
	}

	@Override
	public int selectTotalRecordOfCMember(SearchVO searchVo) {
		return comMemberDao.selectTotalRecordOfCMember(searchVo);
	}

	@Override
	public int deleteCMember(String cMemberCode) {
		return comMemberDao.deleteCMember(cMemberCode);
	}

	@Override
	public int updateCMember(CompanyMemberVO companyMemberVo) {
		return comMemberDao.updateCMember(companyMemberVo);
	}

	@Override
	public String selectMemberCode(String cUserid) {
		return comMemberDao.selectMemberCode(cUserid);
	}

	@Override
	public String selectCMemberPwd(String cUserid) {
		return comMemberDao.selectCMemberPwd(cUserid);
	}
	
	

}
