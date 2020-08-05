package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

public interface ComRecruitDAO {
	
	int insertComRecruit(ComRecruitVO comRecruitVo);
	List<Map<String, Object>> selectMost5();
	ComRecruitVO selectOneCom(String recruitmentCode);
	String selectrecruitmentCode();
	ComRecruitVO checkRecruitmentCode(String comCode);
	int updateResumeType(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo);
}
