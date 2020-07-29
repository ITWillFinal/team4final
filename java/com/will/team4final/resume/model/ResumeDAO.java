package com.will.team4final.resume.model;

import java.util.List;
import java.util.Map;

public interface ResumeDAO {

	int insertResume(ResumeVO resumeVo);
	int insertEducation(EducationVO educationVo);
	int insertCareer(CareerVO careerVo);
	int insertLanguage(LanguageVO languageVo);
	int insertAddinfo(AddinfoVO addInfoVo);
	int insertActive(ActiveVO activeVo);
	int insertAward(AwardVO awardVo);
	int insertPotfolio(PotfolioVO potfolioVo);
	int insertCertify(CertifyVO certifyVo);
	List<ResumeVO> selectResumeByUserNo(String userNo);
	List<Map<String, Object>> selectResumeCareerViewByUserNo(String userNo);
	int deleteResume(int resumeNo);

}
