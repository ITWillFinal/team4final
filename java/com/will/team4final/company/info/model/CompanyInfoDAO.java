package com.will.team4final.company.info.model;

import java.util.List;

public interface CompanyInfoDAO {
	int insertCompanyInfo(CompanyInfoVO vo);
	CompanyInfoVO selectComInfoBycMemberCode(String cMemberCode);
	int updateCominfoByCode(CompanyInfoVO vo);
	CompanyInfoVO selectCompanyInfoByComCode(String comCode);
	List<CompanyInfoVO> selectCompanyInfo();
}
