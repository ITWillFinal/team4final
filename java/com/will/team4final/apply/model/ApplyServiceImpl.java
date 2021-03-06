package com.will.team4final.apply.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired private ApplyDAO applyDao;

	@Override
	public int insertApply(ApplyVO applyVo) {
		int cnt = applyDao.selectApply(applyVo);
		
		if(cnt!=0) {
			return APPLY_EXIST;
		}else {
			return applyDao.insertApply(applyVo);			
		}
		
	}

	@Override
	public int deleteApply(String applyCode) {
		return applyDao.deleteApply(applyCode);
	}

	@Override
	public List<Map<String, Object>> selectApplyForCompany(String recruitmentCode) {
		return applyDao.selectApplyForCompany(recruitmentCode);
	}
	
	public List<Map<String, Object>> selectRecruitmentApply(String userNo ) {
		return applyDao.selectRecruitmentApply(userNo);
	}

	@Override
	public int updateReadcheck(String applyCode) {
		return applyDao.updateReadcheck(applyCode);
	}

	@Override
	public int updateApplyStatus(ApplyVO applyVo) {
		return applyDao.updateApplyStatus(applyVo);
	}

	@Override
	public int selectApply(ApplyVO applyVo) {
		return applyDao.selectApply(applyVo);
	}
}
