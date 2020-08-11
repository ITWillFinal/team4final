package com.will.team4final.apply.model;

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
}
