package com.will.team4final.jobkinds.model;

import java.util.List;
import java.util.Map;

import com.will.team4final.company.model.Recruitment_TosVO;

public interface JobDAO {
	List<Map<String, Object>> selectLarge();
	List<Map<String, Object>> selectInduLarge();
	List<Map<String, Object>> selectJobMiddle(int no);
	List<Map<String, Object>> selectInduMiddle(int no);
	String selectJobLargeName(String jobType);
	String selectInduLargeName(String induType);
	List<Recruitment_TosVO> selectDetailByJobType(String jobType2);
	List<Recruitment_TosVO> selectDetailByInduType(String induType2);
}
