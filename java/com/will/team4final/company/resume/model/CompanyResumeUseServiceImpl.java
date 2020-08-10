package com.will.team4final.company.resume.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyResumeUseServiceImpl implements CompanyResumeUseService {
	@Autowired private CompanyResumeUseDAO companyResumeUseDao;

	@Override
	public int insertCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo) {
		return companyResumeUseDao.insertCompanyResumeUse(companyResumeUseVo);
	}

	@Override
	public CompanyResumeUseVO selectCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo) {
		return companyResumeUseDao.selectCompanyResumeUse(companyResumeUseVo);
	}
	
	
}
