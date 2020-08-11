package com.will.team4final.member.model;

import java.util.List;

import com.will.team4final.apply.model.ApplyVO;
import com.will.team4final.common.SearchVO;

public interface MemberService {
	//아이디 중복확인 관련 상수
	public static final int EXIST_ID=1;  //해당 아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=0;  //아이디가 존재하지 않는 경우

	//로그인 처리 관련 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	public static final int ID_NONE=3; //아이디 존재하지 않음
	
	int insertMember(MemberVO vo);
	int selectMemberDup(String userid);
	String findId(String email);
	int updatePwdByEmail(MemberVO memberVo);
	MemberVO selectByUserid(String user_id);
	MemberVO selectByUerNo(String userNo);
	int loginCheck(String userid, String pwd);
	List<MemberVO> showAllMemberUser(SearchVO searchVo);
	int deleteUser(String userNo);
	int changeResumeNo(MemberVO memberVo);
	int changeYorn(MemberVO memberVo);
	int selectTotalRecordOfMember(SearchVO searchVo);
	int updateMember(MemberVO memberVo);
	List<MemberVO> showMemberForExcel();
	List<ApplyVO> selectApplyByuserNo(String userNo);
}
