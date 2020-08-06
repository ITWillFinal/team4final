package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

public interface ComRecruitDAO {
	
	int insertComRecruit(ComRecruitVO comRecruitVo);
	List<Map<String, Object>> selectMost5();
	ComRecruitVO selectOneCom(String recruitmentCode);
	String selectrecruitmentCode();
	ComRecruitVO selectBycomCode(String comCode);
	int updateResumeType(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> selectListBycomCode(String comCode);
	int updateReadCount(String recruitmentCode);
	List<ComRecruitVO> selectListBycomCode(ComRecruitSearchVO comRecruitSearchVO);
	int selectTotalRecord(ComRecruitSearchVO comRecruitSearchVO);
	int deleteComRecruit(String no);
	int updateComRecruit(ComRecruitVO vo);
	ComRecruitVO selectOneByRecruitmentCode(String recruitmentCode);
	
}
