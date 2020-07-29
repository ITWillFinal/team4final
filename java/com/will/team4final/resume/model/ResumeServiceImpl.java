package com.will.team4final.resume.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ResumeServiceImpl implements ResumeService{
	@Autowired private ResumeDAO resumeDao;
	private final static Logger logger = LoggerFactory.getLogger(ResumeService.class);


	@Transactional
	@Override
	public int insertResume(ResumeAllVO resumeAllVo) {
		ResumeVO resumeVo = resumeAllVo.getResumeVo();
		EducationVO educationVo = resumeAllVo.getEducationVo();
		List<CareerVO> careerVoList = resumeAllVo.getCareerVoList();
		List<ActiveVO> activeVoList = resumeAllVo.getActiveVoList();
		List<CertifyVO> certifyVoList = resumeAllVo.getCertifyVoList();
		List<LanguageVO> languageVoList = resumeAllVo.getLanguageVoList();
		List<AwardVO> awardVoList = resumeAllVo.getAwardVoList();
		AddinfoVO addinfoVo = resumeAllVo.getAddInfoVo();
		PotfolioVO potfolioVo = resumeAllVo.getPotfolioVo();
		
		logger.info("이력서 등록 파라미터 resumeAllVo={}",resumeAllVo);		
		
		int cnt=0;
		
		if(resumeVo!=null) {
			cnt = resumeDao.insertResume(resumeVo);
			logger.info("이력서 등록 결과 cnt={}",cnt);
		}
		
		
		String resumeNo = resumeVo.getResumeNo();			
		
		if(educationVo != null) {
			educationVo.setResumeNo(resumeNo);
			cnt = resumeDao.insertEducation(educationVo);
			logger.info("이력서 - 학력 등록 결과 cnt={}",cnt);			
		}
		
		if(careerVoList !=null && !careerVoList.isEmpty()) {
			for(int i=0; i<careerVoList.size(); i++) {
				CareerVO careerVo = careerVoList.get(i);
				if(careerVo.getCareerCompany().equals("신입")) {
					careerVo.setCareerLocation("-");
					careerVo.setCareerPeriod("-");
					careerVo.setCareerRank("-");
					careerVo.setCareerReason("-");
					careerVo.setCareerSal("-");
					careerVo.setCareerYear("-");
					careerVo.setTask("-");
				}
				careerVo.setResumeNo(resumeNo);
				cnt = resumeDao.insertCareer(careerVo);
				logger.info("이력서 - 경력  등록 결과 cnt={}",cnt);
			}
		}
		
		if(activeVoList !=null && !activeVoList.isEmpty()) {
			for(int i=0; i<activeVoList.size(); i++) {
				ActiveVO activeVo = activeVoList.get(i);
				activeVo.setResumeNo(resumeNo);
				cnt = resumeDao.insertActive(activeVo);
				logger.info("이력서 - 대외활동  등록 결과 cnt={}",cnt);
			}
		}

		if(certifyVoList !=null && !certifyVoList.isEmpty()) {
			for(int i=0; i<certifyVoList.size(); i++) {
				CertifyVO certifyVo = certifyVoList.get(i);
				certifyVo.setResumeNo(resumeNo);
				cnt = resumeDao.insertCertify(certifyVo);
				logger.info("이력서 - 자격증  등록 결과 cnt={}",cnt);
			}
		}

		if(languageVoList !=null && !languageVoList.isEmpty()) {
			for(int i=0; i<languageVoList.size(); i++) {
				LanguageVO languageVo = languageVoList.get(i);
				languageVo.setResumeNo(resumeNo);
				cnt = resumeDao.insertLanguage(languageVo);
				logger.info("이력서 - 어학  등록 결과 cnt={}",cnt);
			}
		}

		if(awardVoList !=null && !awardVoList.isEmpty()) {
			for(int i=0; i<awardVoList.size(); i++) {
				AwardVO awardVo = awardVoList.get(i);
				awardVo.setResumeNo(resumeNo);
				cnt = resumeDao.insertAward(awardVo);
				logger.info("이력서 - 수상내역/공모전  등록 결과 cnt={}",cnt);
			}
		}
		
		if(addinfoVo.getDisable() != null) {
			addinfoVo.setResumeNo(resumeNo);
			cnt = resumeDao.insertAddinfo(addinfoVo);
			logger.info("이력서 - 취업 우대사항 등록 결과 cnt={}",cnt);			
		}
		
		if(potfolioVo.getIntro() !=null) {
			potfolioVo.setResumeNo(resumeNo);
			cnt = resumeDao.insertPotfolio(potfolioVo);
			logger.info("이력서 - 포트폴리오 등록 결과 cnt={}");
		}
		
		return cnt;
	}


	@Override
	public List<ResumeVO> selectResumeByUserNo(String userNo) {
		return resumeDao.selectResumeByUserNo(userNo);
	}

}
