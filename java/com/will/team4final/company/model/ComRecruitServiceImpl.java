package com.will.team4final.company.model;

import java.util.List;

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

	@Override
	public List<ComRecruitVO> selectMost5() {
		return comRecruitDao.selectMost5();
	}

	
}
