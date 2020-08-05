package com.will.team4final.company.resume.model;

public interface CompanyResumeSetService {

	public int insertCompanyResumeSet(CompanyResumeSetVO companyResumeSetVo);
	public CompanyResumeSetVO selectCompanyResumeSet(String recruitmentCode);
	
}
