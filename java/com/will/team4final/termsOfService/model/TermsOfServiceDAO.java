package com.will.team4final.termsOfService.model;

public interface TermsOfServiceDAO {
	int insertTOS(TermsOfServiceVO tosVo);
	TermsOfServiceVO selectByrecruitmentCode(String recruitmentCode);
	int updateEndDate(TermsOfServiceVO tosVo);
}
