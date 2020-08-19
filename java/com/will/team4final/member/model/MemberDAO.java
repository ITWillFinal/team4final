package com.will.team4final.member.model;

import java.util.List;

import com.will.team4final.apply.model.ApplyVO;
import com.will.team4final.common.SearchVO;

public interface MemberDAO {
	
	int insertMember(MemberVO vo);
	int selectMemberDup(String userid);
	String findId(String email);
	int updatePwdByEmail(MemberVO memberVo);
	MemberVO selectByUserid(String user_id);
	MemberVO selectByUerNo(String userNo);
	String selectMemberPwd(String userid);
	List<MemberVO> showAllMemberUser(SearchVO searchVo);
	int deleteUser(String userNo);
	int changeResumeNo(MemberVO memberVo);
	int changeYorn(MemberVO memberVo);
	int selectTotalRecordOfMember(SearchVO searchVo);
	int updateMember(MemberVO memberVo);
	List<MemberVO> showMemberForExcel();
	List<ApplyVO> selectApplyByuserNo(String userNo);
	int emailDupCh(String email);
	
}
