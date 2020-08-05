package com.will.team4final.company.resume.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyResumeSetServiceImpl implements CompanyResumeSetService {
	@Autowired private CompanyResumeSetDAO companyResumeSetDao;

	@Override
	public int insertCompanyResumeSet(CompanyResumeSetVO companyResumeSetVo) {
		return companyResumeSetDao.insertCompanyResumeSet(companyResumeSetVo);
	}

	@Override
	public CompanyResumeSetVO selectCompanyResumeSet(String recruitmentCode) {
		return companyResumeSetDao.selectCompanyResumeSet(recruitmentCode);				
	}
	
}


