package com.will.team4final.member.model;

import java.util.List;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.SearchVO;

public interface MemberDAO {
	
	int insertMember(MemberVO vo);
	int selectMemberDup(String userid);
	String findId(String email);
	int updatePwdByEmail(MemberVO memberVo);
	MemberVO selectByUserid(String user_id);
	MemberVO selectByUerNo(int userNo);
	String selectMemberPwd(String userid);
	List<MemberVO> showAllMemberUser(SearchVO searchvo);
	List<MemberVO> showMemberListByDate(DateSearchVO dateSearchVo);
	int deleteUser(int userNo);
	int selectTotalRecordOfMember(SearchVO searchVo);
	
}
