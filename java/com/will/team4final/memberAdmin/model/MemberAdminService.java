package com.will.team4final.memberAdmin.model;

public interface MemberAdminService {
	//로그인 처리 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	public static final int ID_NONE=3; //아이디 존재하지 않음
	public static final int NO_LEVEL=4; //관리자 권한 없음
	
	public int selectIdDup(String adminId);
	public int insertAdmin(MemberAdminVO vo);
	public int loginCheck(String adminId, String pwd);
	public MemberAdminVO selectByUserid(String adminId);

}
