package com.will.team4final.admin.model;

import java.util.List;

import com.will.team4final.common.SearchVO;
import com.will.team4final.member.model.MemberVO;

public interface AdminDAO {
	List<MemberVO> adminShowAllMember(SearchVO searchVo);
	int selectTotalRecordOfAdmin(SearchVO searchVo);
	int selectTodayRegisterMember();
	int selectTodayRegisterCMember();
	
}
