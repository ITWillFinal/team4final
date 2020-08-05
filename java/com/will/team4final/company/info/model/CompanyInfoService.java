package com.will.team4final.company.info.model;

public interface CompanyInfoService {
	int insertCompanyInfo(CompanyInfoVO vo);
	CompanyInfoVO selectComInfoBycMemberCode(String cMemberCode);
}
