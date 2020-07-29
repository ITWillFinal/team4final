package com.will.team4final.resume.model;

import java.util.List;

public interface ResumeService {
	
	int insertResume(ResumeAllVO resumeAllVo);
	List<ResumeVO> selectResumeByUserNo(String userNo);
}
