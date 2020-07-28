package com.will.team4final.company.info.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyInfoServiceImpl implements CompanyInfoService {
	@Autowired private CompanyInfoDAO companyInfoDao;

	@Override
	public int insertCompanyInfo(CompanyInfoVO vo) {
		return companyInfoDao.insertCompanyInfo(vo);
	}
}
