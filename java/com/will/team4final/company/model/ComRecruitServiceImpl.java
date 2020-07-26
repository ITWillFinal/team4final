package com.will.team4final.company.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComRecruitServiceImpl implements ComRecruitService {
	@Autowired 
	private ComRecruitDAO comRecruitDao;

	@Override
	public int insertComRecruit(ComRecruitVO comRecruitVo) {
		return comRecruitDao.insertComRecruit(comRecruitVo);
	}

	
}
