package com.will.team4final.termsOfService.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TermsOfServiceServiceImpl implements TermsOfServiceService {
	@Autowired private TermsOfServiceDAO tosDao;

	@Override
	public int insertTOS(TermsOfServiceVO tosVo) {
		return tosDao.insertTOS(tosVo);
	}

	@Override
	public TermsOfServiceVO selectByrecruitmentCode(String recruitmentCode) {
		return tosDao.selectByrecruitmentCode(recruitmentCode);
	}

	@Override
	public int updateEndDate(TermsOfServiceVO tosVo) {
		return tosDao.updateEndDate(tosVo);
	}
	
	
}
