package com.will.team4final.company.resume.model;

public interface CompanyResumeUseDAO {
	
	public int insertCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo);
	public int updateCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo);
	public int countCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo);
	CompanyResumeUseVO selectCompanyResumeUse(CompanyResumeUseVO companyResumeUseVo);
	
}