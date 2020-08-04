package com.will.team4final.resume.model;

import java.util.List;
import java.util.Map;

public interface ResumeService {
	
	int insertResume(ResumeAllVO resumeAllVo);
	List<ResumeVO> selectResumeByUserNo(String userNo);
	List<Map<String, Object>> selectResumeCareerViewByUserNo(String userNo);
	int deleteResume(int resumeNo);
	ResumeAllVO selectResumeByResumNo(int resumeNo);
	int updateResume(ResumeAllVO resumeAllVo);
}
