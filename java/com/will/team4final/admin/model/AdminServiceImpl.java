package com.will.team4final.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.team4final.common.SearchVO;
import com.will.team4final.member.model.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired AdminDAO adminDao;

	@Override
	public List<MemberVO> adminShowAllMember(SearchVO searchVo) {
		return adminDao.adminShowAllMember(searchVo);
	}

	@Override
	public int selectTotalRecordOfAdmin(SearchVO searchVo) {
		return adminDao.selectTotalRecordOfAdmin(searchVo);
	}

	@Override
	public int selectTodayRegisterMember() {
		return adminDao.selectTodayRegisterMember();
	}

	@Override
	public int selectTodayRegisterCMember() {
		return adminDao.selectTodayRegisterCMember();
	}
	
	
}
