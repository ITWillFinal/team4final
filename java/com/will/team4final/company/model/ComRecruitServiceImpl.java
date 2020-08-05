package com.will.team4final.company.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.team4final.scrap.model.ComScrapVO;

@Service
public class ComRecruitServiceImpl implements ComRecruitService {
	@Autowired 
	private ComRecruitDAO comRecruitDao;

	@Override
	public int insertComRecruit(ComRecruitVO comRecruitVo) {
		return comRecruitDao.insertComRecruit(comRecruitVo);
	}

	@Override
	public List<Map<String, Object>> selectMost5() {
		return comRecruitDao.selectMost5();
	}

	@Override
	public ComRecruitVO selectOneCom(String recruitmentCode) {
		return comRecruitDao.selectOneCom(recruitmentCode);
	}

	@Override
	public String selectrecruitmentCode() {
		return comRecruitDao.selectrecruitmentCode();
	}

	@Override
	public ComRecruitVO selectBycomCode(String comCode) {
		return comRecruitDao.selectBycomCode(comCode);
	}

	@Override
	public int updateResumeType(ComRecruitVO comRecruitVo) {
		return comRecruitDao.updateResumeType(comRecruitVo);
	}

	@Override
	public List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo) {
		return comRecruitDao.recruitmentDetailList(comRecruitVo);
	}
	
	public List<ComRecruitVO> selectListBycomCode(String comCode) {
		return comRecruitDao.selectListBycomCode(comCode);
	}

	@Override
	public List<ComRecruitVO> selectScrapList(List<ComScrapVO> scrapList) {
		List<ComRecruitVO> list = new ArrayList<ComRecruitVO>();
		for (int i = 0; i < scrapList.size(); i++) {
			ComScrapVO comScrap = scrapList.get(i);
			ComRecruitVO rectuitVo = comRecruitDao.selectOneCom(comScrap.getRecruitmentCode());
			list.add(rectuitVo);
		}
		return list;
	}

	@Override
	public int updateReadCount(String recruitmentCode) {
		return comRecruitDao.updateReadCount(recruitmentCode);
	}
	
}
