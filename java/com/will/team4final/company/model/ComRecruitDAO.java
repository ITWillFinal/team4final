package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

public interface ComRecruitDAO {
	
	int insertComRecruit(ComRecruitVO comRecruitVo);
	List<Recruitment_TosVO> selectMost5();
	Recruitment_TosVO selectOneCom(String recruitmentCode);
	String selectrecruitmentCode();
	ComRecruitVO selectBycomCode(String comCode);
	int updateResumeType(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> selectListBycomCode(String comCode);
	int updateReadCount(String recruitmentCode);
	List<ComRecruitVO> selectListBycomCode(ComRecruitSearchVO comRecruitSearchVO);
	int selectTotalRecord(ComRecruitSearchVO comRecruitSearchVO);
	int deleteComRecruit(String no);
	Recruitment_TosVO selectTosOneCom(String recruitmentCode);
	List<ComRecruitVO> selectAllRecruitment();
	int updateComRecruit(ComRecruitVO vo);
	ComRecruitVO selectOneByRecruitmentCode(String recruitmentCode);
	List<Recruitment_TosVO> selectHot100();
	List<Recruitment_TosVO> selectList_tosByComcode(String comCode);
	
	
	
}
