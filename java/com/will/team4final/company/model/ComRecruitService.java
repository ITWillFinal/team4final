package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

import com.will.team4final.scrap.model.ComScrapVO;

public interface ComRecruitService {
	int insertComRecruit(ComRecruitVO comRecruitVo);
	List<Map<String, Object>> selectMost5();
	ComRecruitVO selectOneCom(String recruitmentCode);
	String selectrecruitmentCode();
	ComRecruitVO selectBycomCode(String comCode);
	int updateResumeType(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> selectListBycomCode(String comCode);
	List<ComRecruitVO> selectScrapList(List<ComScrapVO> scrapList);
	int updateReadCount(String recruitmentCode);
}
