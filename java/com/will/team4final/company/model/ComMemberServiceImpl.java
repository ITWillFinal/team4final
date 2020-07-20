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
		int result=0;
		if(cnt>0) {
			result=EXIST_ID;
		}else {
			result=NON_EXIST_ID;
		}
		return result;
	}
	
	

}