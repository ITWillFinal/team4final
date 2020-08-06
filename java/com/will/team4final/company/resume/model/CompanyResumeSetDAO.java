package com.will.team4final.company.resume.model;

public interface CompanyResumeSetDAO {
	
	public int insertCompanyResumeSet(CompanyResumeSetVO companyResumeSetVo);
	public CompanyResumeSetVO selectCompanyResumeSet(String recruitmentCode);
	
		
}
