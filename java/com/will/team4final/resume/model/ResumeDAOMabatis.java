package com.will.team4final.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOMabatis implements ResumeDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.will.team4final.resume.";
	
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
	
	
}
