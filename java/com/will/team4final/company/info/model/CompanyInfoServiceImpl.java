package com.will.team4final.company.info.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyInfoServiceImpl implements CompanyInfoService {
	@Autowired private CompanyInfoDAO companyInfoDao;

	@Override
	public int insertCompanyInfo(CompanyInfoVO vo) {
		return companyInfoDao.insertCompanyInfo(vo);
	}

	@Override
	public CompanyInfoVO selectComInfoBycMemberCode(String cMemberCode) {
		return companyInfoDao.selectComInfoBycMemberCode(cMemberCode);
	}

	@Override
	public int updateCominfoByCode(CompanyInfoVO vo) {
		return companyInfoDao.updateCominfoByCode(vo);
	}

	@Override
	public CompanyInfoVO selectCompanyInfoByComCode(String comCode) {
		return companyInfoDao.selectCompanyInfoByComCode(comCode);
	}

	@Override
	public List<CompanyInfoVO> selectCompanyInfo() {
		return companyInfoDao.selectCompanyInfo();
	}	
	
}
