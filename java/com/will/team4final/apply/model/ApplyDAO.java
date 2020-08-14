package com.will.team4final.apply.model;

import java.util.List;
import java.util.Map;

public interface ApplyDAO {
	public int insertApply(ApplyVO applyVo);
	public int selectApply(ApplyVO applyVo);
	int deleteApply(String applyCode);
	List<Map<String, Object>> selectRecruitmentApply(String userNo);
}
