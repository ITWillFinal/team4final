package com.will.team4final.company.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface ComMemberDAO {
	int insertCMember(CompanyMemberVO vo);
	int selectCMemberDup(String cUserid);
	String findCMemberId(String cEmail);
	int updateCMemberPwdByEmail(CompanyMemberVO companyMemberVo);
	CompanyMemberVO selectCMemberInfoByUserid(String cUserid);
	CompanyMemberVO selectCMemberByUserCode(int userNo);
	String selectCMemberPwd(String cUserid);
	List<CompanyMemberVO> showAllCMember(SearchVO searchVo);
	int selectTotalRecordOfCMember(SearchVO searchVo);
}
