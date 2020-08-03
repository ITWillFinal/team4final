package com.will.team4final.memberAdmin.model;

public interface MemberAdminDAO {
	public int selectIdDup(String adminId);
	public int insertAdmin(MemberAdminVO vo);
<<<<<<< HEAD
=======
	public String selectMemberPwd(String adminId);
	public MemberAdminVO selectByUserid(String adminId);
	public String selectLevel(String adminId);
>>>>>>> b7296c52e279172e6788ba3c48ad537d54734953

}
