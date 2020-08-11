package com.will.team4final.apply.model;

public interface ApplyDAO {
	public int insertApply(ApplyVO applyVo);
	public int selectApply(ApplyVO applyVo);
	int deleteApply(String applyCode);
}
