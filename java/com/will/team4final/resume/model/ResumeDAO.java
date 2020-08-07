package com.will.team4final.resume.model;

import java.util.List;
import java.util.Map;

import com.will.team4final.member.model.MemberVO;

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
	List<Integer> searchTalent(String jobtype);
	List<Integer> searchTalentByCareerYear(int careerYear);
	List<Integer> searchTalentByLocation(String location);
	List<Integer> searchTalentBySal(String sal);
	ResumeTalentVO selectResumeTalent(int resumeNo);
	MemberVO selectMemberByResumeNo(int resumeNo);
	int requestToJoin(Map<String, String> map);
	List<Integer> selectResumeNoFromPerscrap(Map<String, String> map);
	int updatePerscrapStatus(Map<String,String> map);
	int deletePerscrap(Map<String,String> map);
	
}
