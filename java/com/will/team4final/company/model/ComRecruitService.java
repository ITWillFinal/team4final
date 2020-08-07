package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

import com.will.team4final.scrap.model.ComScrapVO;

public interface ComRecruitService {
	int insertComRecruit(ComRecruitVO comRecruitVo);
	List<Recruitment_TosVO> selectMost5();
	ComRecruitVO selectOneCom(String recruitmentCode);
	String selectrecruitmentCode();
	ComRecruitVO selectBycomCode(String comCode);
	int updateResumeType(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> selectListBycomCode(String comCode);
	List<Recruitment_TosVO> selectScrapList(List<ComScrapVO> scrapList);
	int updateReadCount(String recruitmentCode);
	List<ComRecruitVO> selectListBycomCode(ComRecruitSearchVO comRecruitSearchVO);
	int selectTotalRecord(ComRecruitSearchVO comRecruitSearchVO);
	
	int deleteMulti(List<ComRecruitVO> list);
	Recruitment_TosVO selectTosOneCom(String recruitmentCode);
	List<ComRecruitVO> selectAllRecruitment();
	int deleteOne(String recruitmentCode);
	
	int updateComRecruit(ComRecruitVO vo);
	ComRecruitVO selectOneByRecruitmentCode(String recruitmentCode);
	List<Recruitment_TosVO> selectHot100();
	List<Recruitment_TosVO> selectList_tosByComcode(String comCode);
}
