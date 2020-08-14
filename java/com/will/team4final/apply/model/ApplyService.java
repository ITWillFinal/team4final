package com.will.team4final.apply.model;

import java.util.List;
import java.util.Map;

public interface ApplyService {
	public final static int APPLY_EXIST = -1;
	public int insertApply(ApplyVO applyVo);
	int deleteApply(String applyCode);
	List<Map<String, Object>> selectApplyForCompany(String recruitmentCode);
	List<Map<String, Object>> selectRecruitmentApply( String userNo);
	int updateReadcheck(String applyCode);
}
