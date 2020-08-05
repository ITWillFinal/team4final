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
	ResumeVO selectResumeByResumeNo(int resumeNo);
	EducationVO selectEducationByResumeNo(int resumeNo);
	List<CareerVO> selectCareerByResumeNo(int resumeNo);
	List<ActiveVO> selectActiveByResumeNo(int resumeNo);
	List<CertifyVO> selectCertifyByResumeNo(int resumeNo);
	List<LanguageVO> selectLanguageByResumeNo(int resumeNo);
	List<AwardVO> selectAwardByResumeNo(int resumeNo);
	AddinfoVO selectAddInfoByResumeNo(int resumeNo);
	PotfolioVO selectPotfolioByResumeNo(int resumeNo);
	int updateResume(ResumeVO resumeVo);
	int deleteEducation(int resumeNo);
	int deleteCareer(int resumeNo);
	int deleteActive(int resumeNo);
	int deleteAddinfo(int resumeNo);
	int deleteCertify(int resumeNo);
	int deleteLanguage(int resumeNo);
	int deleteAward(int resumeNo);
	int deletePotfolio(int resumeNo);
}
