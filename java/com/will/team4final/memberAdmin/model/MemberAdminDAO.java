package com.will.team4final.memberAdmin.model;

import java.util.List;
import java.util.Map;

public interface MemberAdminDAO {
	public int selectIdDup(String adminId);
	public int insertAdmin(MemberAdminVO vo);
	public String selectMemberPwd(String adminId);
	public MemberAdminVO selectByUserid(String adminId);
	public String selectLevel(String adminId);
	public List<Map<String, Object>> selectInfo();

}
