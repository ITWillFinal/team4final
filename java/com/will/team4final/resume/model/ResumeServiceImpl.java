package com.will.team4final.resume.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.member.model.MemberVO;

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
					careerVo.setCareerYear("0");
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


	@Override
	public List<Map<String, Object>> selectResumeCareerViewByUserNo(String userNo) {
		return resumeDao.selectResumeCareerViewByUserNo(userNo);
	}


	@Override
	public int deleteResume(int resumeNo) {
		return resumeDao.deleteResume(resumeNo);
	}


	@Override
	public ResumeAllVO selectResumeByResumNo(int resumeNo) {
		ResumeAllVO resumeAllVo = new ResumeAllVO();
		
		resumeAllVo.setResumeVo(resumeDao.selectResumeByResumeNo(resumeNo));
		resumeAllVo.setEducationVo(resumeDao.selectEducationByResumeNo(resumeNo));
		resumeAllVo.setCareerVoList(resumeDao.selectCareerByResumeNo(resumeNo));
		resumeAllVo.setActiveVoList(resumeDao.selectActiveByResumeNo(resumeNo));
		resumeAllVo.setCertifyVoList(resumeDao.selectCertifyByResumeNo(resumeNo));
		resumeAllVo.setLanguageVoList(resumeDao.selectLanguageByResumeNo(resumeNo));
		resumeAllVo.setAwardVoList(resumeDao.selectAwardByResumeNo(resumeNo));
		resumeAllVo.setAddInfoVo(resumeDao.selectAddInfoByResumeNo(resumeNo));
		resumeAllVo.setPotfolioVo(resumeDao.selectPotfolioByResumeNo(resumeNo));
		
		return resumeAllVo;
	}


	@Override
	@Transactional
	public int updateResume(ResumeAllVO resumeAllVo) {
		int resumeNo = Integer.parseInt(resumeAllVo.getResumeVo().getResumeNo());
		ResumeVO resumeVo = resumeAllVo.getResumeVo();
		EducationVO educationVo = resumeAllVo.getEducationVo();
		List<CareerVO> careerVoList = resumeAllVo.getCareerVoList();
		List<ActiveVO> activeVoList = resumeAllVo.getActiveVoList();
		List<CertifyVO> certifyVoList = resumeAllVo.getCertifyVoList();
		List<LanguageVO> languageVoList = resumeAllVo.getLanguageVoList();
		List<AwardVO> awardVoList = resumeAllVo.getAwardVoList();
		AddinfoVO addinfoVo = resumeAllVo.getAddInfoVo();
		PotfolioVO potfolioVo = resumeAllVo.getPotfolioVo();
		
		int cnt = resumeDao.updateResume(resumeVo);
		logger.info("이력서 수정 결과 cnt={}",cnt);
		cnt = resumeDao.deleteEducation(resumeNo);
		logger.info("학력 삭제 결과 cnt={}",cnt);
		cnt = resumeDao.deleteCareer(resumeNo);
		logger.info("경력 삭제 결과 cnt={}",cnt);
		cnt = resumeDao.deleteActive(resumeNo);
		logger.info("대외활동 삭제 결과 cnt={}",cnt);
		cnt = resumeDao.deleteCertify(resumeNo);
		logger.info("자격증 삭제 결과 cnt={}",cnt);
		cnt = resumeDao.deleteLanguage(resumeNo);
		logger.info("어학 삭제 결과 cnt={}",cnt);
		cnt = resumeDao.deleteAward(resumeNo);
		logger.info("수상 삭제 결과 cnt={}",cnt);
		cnt = resumeDao.deleteAddinfo(resumeNo);
		logger.info("우대사항 삭제 결과 cnt={}",cnt);
		cnt = resumeDao.deletePotfolio(resumeNo);
		logger.info("포트폴리오 삭제 결과 cnt={}",cnt);
		cnt=0;		
		
		if(educationVo != null) {
			educationVo.setResumeNo(Integer.toString(resumeNo));
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
					careerVo.setCareerYear("0");
					careerVo.setTask("-");
				}
				careerVo.setResumeNo(Integer.toString(resumeNo));
				cnt = resumeDao.insertCareer(careerVo);
				logger.info("이력서 - 경력  등록 결과 cnt={}",cnt);
			}
		}
		
		if(activeVoList !=null && !activeVoList.isEmpty()) {
			for(int i=0; i<activeVoList.size(); i++) {
				ActiveVO activeVo = activeVoList.get(i);
				activeVo.setResumeNo(Integer.toString(resumeNo));
				cnt = resumeDao.insertActive(activeVo);
				logger.info("이력서 - 대외활동  등록 결과 cnt={}",cnt);
			}
		}

		if(certifyVoList !=null && !certifyVoList.isEmpty()) {
			for(int i=0; i<certifyVoList.size(); i++) {
				CertifyVO certifyVo = certifyVoList.get(i);
				certifyVo.setResumeNo(Integer.toString(resumeNo));
				cnt = resumeDao.insertCertify(certifyVo);
				logger.info("이력서 - 자격증  등록 결과 cnt={}",cnt);
			}
		}

		if(languageVoList !=null && !languageVoList.isEmpty()) {
			for(int i=0; i<languageVoList.size(); i++) {
				LanguageVO languageVo = languageVoList.get(i);
				languageVo.setResumeNo(Integer.toString(resumeNo));
				cnt = resumeDao.insertLanguage(languageVo);
				logger.info("이력서 - 어학  등록 결과 cnt={}",cnt);
			}
		}

		if(awardVoList !=null && !awardVoList.isEmpty()) {
			for(int i=0; i<awardVoList.size(); i++) {
				AwardVO awardVo = awardVoList.get(i);
				awardVo.setResumeNo(Integer.toString(resumeNo));
				cnt = resumeDao.insertAward(awardVo);
				logger.info("이력서 - 수상내역/공모전  등록 결과 cnt={}",cnt);
			}
		}
		
		if(addinfoVo.getDisable() != null) {
			addinfoVo.setResumeNo(Integer.toString(resumeNo));
			cnt = resumeDao.insertAddinfo(addinfoVo);
			logger.info("이력서 - 취업 우대사항 등록 결과 cnt={}",cnt);			
		}
		
		if(potfolioVo.getIntro() !=null) {
			potfolioVo.setResumeNo(Integer.toString(resumeNo));
			cnt = resumeDao.insertPotfolio(potfolioVo);
			logger.info("이력서 - 포트폴리오 등록 결과 cnt={}");
		}
		
		return cnt;
	}


	@Override
	public List<Integer> searchTalent(String jobtype) {
		return resumeDao.searchTalent(jobtype);
	}


	@Override
	public List<Integer> searchTalentByCareerYear(int careerYear) {
		return resumeDao.searchTalentByCareerYear(careerYear);
	}


	@Override
	public List<Integer> searchTalentByLocation(String location) {
		return resumeDao.searchTalentByLocation(location);
	}


	@Override
	public List<Integer> searchTalentBySal(String sal) {
		return resumeDao.searchTalentBySal(sal);
	}


	@Override
	public ResumeTalentVO selectResumeTalent(int resumeNo) {
		return resumeDao.selectResumeTalent(resumeNo);
	}


	@Override
	public MemberVO selectMemberByResumeNo(int resumeNo) {
		return resumeDao.selectMemberByResumeNo(resumeNo);
	}

	@Transactional
	@Override
	public String requestToJoinMulti(List<Integer> resumeNoList, String cMemberCode) {
		String fail="";
		for(int resumeNo : resumeNoList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("resumeNo",Integer.toString(resumeNo));
			map.put("cMemberCode",cMemberCode);
			int cnt=0;
			try {
				cnt = resumeDao.requestToJoin(map);				
			} catch (DataIntegrityViolationException e) {
				if(cnt<1) {
					fail+=Integer.toString(resumeNo)+",";
				}
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
		}
		
		if(fail.length()>0) {
			fail = "이력서 번호 "+fail.substring(0, fail.length()-1)+"은(는) 이미 입사요청을 보냈습니다.\n다시 선택해 주세요";
			return fail;
		}
		
		return "입사 요청 완료";
	}

	public List<List<ResumeTalentVO>> perscrapList(String cMemberCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("status","WAITING");
		map.put("cMemberCode",cMemberCode);
		
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("status","N");
		map2.put("cMemberCode",cMemberCode);		
		
		Map<String, String> map3 = new HashMap<String, String>();
		map3.put("status","Y");
		map3.put("cMemberCode",cMemberCode);		
		
		List<List<ResumeTalentVO>> resultList = new ArrayList<List<ResumeTalentVO>>();
		List<ResumeTalentVO> waitingList = new ArrayList<ResumeTalentVO>();
		List<ResumeTalentVO> noList = new ArrayList<ResumeTalentVO>();
		List<ResumeTalentVO> yesList = new ArrayList<ResumeTalentVO>();
		
		List<Integer> list = resumeDao.selectResumeNoFromPerscrap(map);
		logger.info("입사요청 - 대기중 : {}",list.size());
		for(int i=0; i<list.size(); i++) {
			int resumeNo = list.get(i);
			waitingList.add(resumeDao.selectResumeTalent(resumeNo));	
		}
		
		list = resumeDao.selectResumeNoFromPerscrap(map2);
		logger.info("입사요청 - 입사거부 : {}",list.size());
		for(int i=0; i<list.size(); i++) {
			int resumeNo = list.get(i);
			noList.add(resumeDao.selectResumeTalent(resumeNo));	
		}

		list = resumeDao.selectResumeNoFromPerscrap(map3);
		logger.info("입사요청 - 입사희망 : {}",list.size());
		for(int i=0; i<list.size(); i++) {
			int resumeNo = list.get(i);
			yesList.add(resumeDao.selectResumeTalent(resumeNo));	
		}
		
		resultList.add(waitingList);
		resultList.add(noList);
		resultList.add(yesList);
		
		return resultList;
	}

	@Transactional
	public String updatePerscrapStatusMulti(List<Integer> resumeNoList,String cMemberCode, String status) {
		
		String result = "변경에 되었습니다.";
		for(int i=0; i<resumeNoList.size(); i++) {
			Map<String,String> map = new HashMap<String, String>();
			int resumeNo = resumeNoList.get(i);
			map.put("status",status);
			map.put("resumeNo",Integer.toString(resumeNo));
			map.put("cMemberCode",cMemberCode);
			
			int cnt = resumeDao.updatePerscrapStatus(map);
			if(cnt<1) {
				result = "변경에 실패했습니다.";
			}
		}
		
		return result;
	}

	@Transactional
	public String deletePerscrapMulti(List<Integer> resumeNoList,String cMemberCode) {
		
		String result = "요청을 취소했습니다.";
		for(int i=0; i<resumeNoList.size(); i++) {
			Map<String,String> map = new HashMap<String, String>();
			int resumeNo = resumeNoList.get(i);
			map.put("resumeNo",Integer.toString(resumeNo));
			map.put("cMemberCode",cMemberCode);
			
			int cnt = resumeDao.deletePerscrap(map);
			if(cnt<1) {
				result = "요청 취소에 실패했습니다.";
			}
		}
		
		return result;
	}
}
