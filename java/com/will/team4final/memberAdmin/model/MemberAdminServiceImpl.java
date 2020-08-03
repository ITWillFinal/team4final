package com.will.team4final.memberAdmin.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.common.SearchVO;

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

	@Override
	public int loginCheck(String adminId, String pwd) {
		int result = 0;
		
		int idCheck = memberAdminDao.selectIdDup(adminId);
		if(idCheck>0) {
			String pwdCheck = memberAdminDao.selectMemberPwd(adminId);
			if(memberAdminDao.selectLevel(adminId)==null
					|| memberAdminDao.selectLevel(adminId).isEmpty()) {
				result = NO_LEVEL;
			}else if(pwd.equals(pwdCheck)) {
				result = LOGIN_OK;
			}else if(!pwd.equals(pwdCheck)) {
				result = PWD_DISAGREE;
			}
		}else {
			result = ID_NONE;
		}
		
		return result;
	}

	@Override
	public MemberAdminVO selectByUserid(String adminId) {
		return memberAdminDao.selectByUserid(adminId);
	}

	@Override
	public List<MemberLevelVO> levels() {
		return memberAdminDao.levels();
	}

	@Override
	public List<Map<String, Object>> selectInfo(SearchVO searchVo) {
		return memberAdminDao.selectInfo(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return memberAdminDao.selectTotalRecord(searchVo);
	}

	
	@Override
	@Transactional
	public int deleteMulti(List<MemberAdminVO> list) {
		int cnt = 0;
		try {
			for(MemberAdminVO vo : list) {
				if(vo.getAdminNo() != 0) {
					cnt = memberAdminDao.deleteAdmin(vo.getAdminNo());
				}
			}
		}catch (RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
		
	}

	@Override
	public int deleteAdmin(int adminNo) {
		return memberAdminDao.deleteAdmin(adminNo);
	}

	@Override
	@Transactional
	public int updateLevelMulti(List<MemberAdminVO> list, int level) {
		int cnt = 0;
		try {
			for(MemberAdminVO vo : list) {
				if(vo.getAdminNo() != 0) {
					cnt = memberAdminDao.updateLevel(vo);
				}
			}
		}catch (RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public int updateLevel(MemberAdminVO vo) {
		return memberAdminDao.updateLevel(vo);
	}

	@Override
	public MemberAdminVO selectByNO(int adminNo) {
		return memberAdminDao.selectByNO(adminNo);
	}


}
