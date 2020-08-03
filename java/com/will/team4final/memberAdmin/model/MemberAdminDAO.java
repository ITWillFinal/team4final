package com.will.team4final.memberAdmin.model;

public interface MemberAdminDAO {
	public int selectIdDup(String adminId);
	public int insertAdmin(MemberAdminVO vo);
	public String selectMemberPwd(String adminId);
	public MemberAdminVO selectByUserid(String adminId);
	public String selectLevel(String adminId);

}
