package com.will.team4final.memberAdmin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberAdminServiceImpl implements MemberAdminService{
	
	@Autowired MemberAdminDAO memberAdminDao;

	@Override
	public int selectIdDup(String adminId) {
		return memberAdminDao.selectIdDup(adminId);
	}

	@Override
	public int insertAdmin(MemberAdminVO vo) {
		return memberAdminDao.insertAdmin(vo);
	}

}
