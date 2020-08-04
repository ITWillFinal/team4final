package com.will.team4final.memberAdmin.model;

import java.util.List;
import java.util.Map;

import com.will.team4final.common.SearchVO;

public interface MemberAdminDAO {
	public int selectIdDup(String adminId);
	public int insertAdmin(MemberAdminVO vo);
	public String selectMemberPwd(String adminId);
	public MemberAdminVO selectByUserid(String adminId);
	public String selectLevel(String adminId);
	public List<MemberAdminVO> selectInfo(SearchVO searchVo);
	public List<MemberLevelVO> levels();
	public int selectTotalRecord(SearchVO searchVo);
	public int deleteAdmin(int adminNo);
	public int updateLevel(MemberAdminVO vo);
	public MemberAdminVO selectByNO(int adminNo);
}
