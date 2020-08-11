package com.will.team4final.resume.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.member.model.MemberVO;

@Repository
public class ResumeDAOMabatis implements ResumeDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.will.team4final.resume.";
	private String namespace2="com.will.team4final.searchTalent.";
	
	@Override
	public int insertResume(ResumeVO resumeVo) {
		return sqlSession.insert(namespace+"insertResume",resumeVo);
	}

	@Override
	public int insertEducation(EducationVO educationVo) {
		return sqlSession.insert(namespace+"insertEducation",educationVo);
	}

	@Override
	public int insertCareer(CareerVO careerVo) {
		return sqlSession.insert(namespace+"insertCareer",careerVo);
	}

	@Override
	public int insertLanguage(LanguageVO languageVo) {
		return sqlSession.insert(namespace+"insertLanguage",languageVo);
	}

	@Override
	public int insertAddinfo(AddinfoVO addinfoVo) {
		return sqlSession.insert(namespace+"insertAddinfo",addinfoVo);
	}

	@Override
	public int insertActive(ActiveVO activeVo) {
		return sqlSession.insert(namespace+"insertActive",activeVo);
	}

	@Override
	public int insertAward(AwardVO awardVo) {
		return sqlSession.insert(namespace+"insertAward",awardVo);
	}

	@Override
	public int insertPotfolio(PotfolioVO potfolioVo) {
		return sqlSession.insert(namespace+"insertPotfolio",potfolioVo);
	}

	@Override
	public int insertCertify(CertifyVO certifyVo) {
		return sqlSession.insert(namespace+"insertCertify",certifyVo);
	}

	@Override
	public List<ResumeVO> selectResumeByUserNo(String userNo) {
		return sqlSession.selectList(namespace+"selectResumeByUserNo",userNo);
	}

	@Override
	public List<Map<String, Object>> selectResumeCareerViewByUserNo(String userNo) {
		return sqlSession.selectList(namespace+"selectResumeCareerViewByUserNo",userNo);
	}

	@Override
	public int deleteResume(int resumeNo) {
		return sqlSession.delete(namespace+"deleteResume",resumeNo);
	}

	@Override
	public ResumeVO selectResumeByResumeNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectResumeByResumeNo",resumeNo);
	}

	@Override
	public EducationVO selectEducationByResumeNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectEducationByResumeNo",resumeNo);
	}

	@Override
	public List<CareerVO> selectCareerByResumeNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectCareerByResumeNo",resumeNo);
	}

	@Override
	public List<ActiveVO> selectActiveByResumeNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectActiveByResumeNo",resumeNo);
	}

	@Override
	public List<CertifyVO> selectCertifyByResumeNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectCertifyByResumeNo",resumeNo);
	}

	@Override
	public List<LanguageVO> selectLanguageByResumeNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectLanguageByResumeNo",resumeNo);
	}

	@Override
	public List<AwardVO> selectAwardByResumeNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectAwardByResumeNo",resumeNo);
	}

	@Override
	public AddinfoVO selectAddInfoByResumeNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectAddInfoByResumeNo",resumeNo);
	}

	@Override
	public PotfolioVO selectPotfolioByResumeNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectPotfolioByResumeNo",resumeNo);
	}

	@Override
	public int updateResume(ResumeVO resumeVo) {
		return sqlSession.update(namespace+"updateResume",resumeVo);
	}

	@Override
	public int deleteEducation(int resumeNo) {
		return sqlSession.delete(namespace+"deleteEducation",resumeNo);
	}

	@Override
	public int deleteCareer(int resumeNo) {
		return sqlSession.delete(namespace+"deleteCareer",resumeNo);
	}

	@Override
	public int deleteActive(int resumeNo) {
		return sqlSession.delete(namespace+"deleteActive",resumeNo);

	}

	@Override
	public int deleteCertify(int resumeNo) {
		return sqlSession.delete(namespace+"deleteCertify",resumeNo);

	}

	@Override
	public int deleteLanguage(int resumeNo) {
		return sqlSession.delete(namespace+"deleteLanguage",resumeNo);

	}

	@Override
	public int deleteAward(int resumeNo) {
		return sqlSession.delete(namespace+"deleteAward",resumeNo);

	}

	@Override
	public int deletePotfolio(int resumeNo) {
		return sqlSession.delete(namespace+"deletePotfolio",resumeNo);

	}

	@Override
	public int deleteAddinfo(int resumeNo) {
		return sqlSession.delete(namespace+"deleteAddinfo",resumeNo);
	}

	@Override
	public List<Integer> searchTalent(String jobtype) {
		return sqlSession.selectList(namespace2+"searchTalent",jobtype);
	}

	@Override
	public List<Integer> searchTalentByCareerYear(int careerYear) {
		return sqlSession.selectList(namespace2+"searchTalentByCareerYear",careerYear);
	}

	@Override
	public List<Integer> searchTalentByLocation(String location) {
		return sqlSession.selectList(namespace2+"searchTalentByLocation",location);
	}

	@Override
	public List<Integer> searchTalentBySal(String sal) {
		return sqlSession.selectList(namespace2+"searchTalentBySal",sal);
	}

	@Override
	public ResumeTalentVO selectResumeTalent(int resumeNo) {
		return sqlSession.selectOne(namespace2+"selectResumeTalent",resumeNo);
	}

	@Override
	public MemberVO selectMemberByResumeNo(int resumeNo) {
		return sqlSession.selectOne(namespace2+"selectMemberByResumeNo",resumeNo);
	}

	@Override
	public int requestToJoin(Map<String, String> map) {
		return sqlSession.insert(namespace2+"requestToJoin",map);
	}

	@Override
	public List<Integer> selectResumeNoFromPerscrap(Map<String, String> map) {
		return sqlSession.selectList(namespace2+"selectResumeNoFromPerscrap",map);
	}

	@Override
	public int updatePerscrapStatus(Map<String, String> map) {
		return sqlSession.update(namespace2+"updatePerscrapStatus",map);
	}

	@Override
	public int deletePerscrap(Map<String, String> map) {
		return sqlSession.delete(namespace2+"deletePerscrap",map);
	}

	@Override
	public List<Map<String, Object>> selectPerscrapByUserNo(String userNo) {
		return sqlSession.selectList(namespace2+"selectPerscrapByUserNo",userNo);
	}
	
	
}
