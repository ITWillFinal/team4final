package com.will.team4final.resume.model;

import java.util.List;

public class ResumeAllVO {
	private ResumeVO resumeVo;
	private EducationVO educationVo;
	private List<CareerVO> careerVoList;
	private List<ActiveVO> activeVoList;
	private List<CertifyVO> certifyVoList;
	private List<LanguageVO> languageVoList;
	private List<AwardVO> awardVoList;
	private AddinfoVO addInfoVo;
	private PotfolioVO potfolioVo;
	
	public ResumeVO getResumeVo() {
		return resumeVo;
	}
	public void setResumeVo(ResumeVO resumeVo) {
		this.resumeVo = resumeVo;
	}
	public EducationVO getEducationVo() {
		return educationVo;
	}
	public void setEducationVo(EducationVO educationVo) {
		this.educationVo = educationVo;
	}
	public List<CareerVO> getCareerVoList() {
		return careerVoList;
	}
	public void setCareerVoList(List<CareerVO> careerVoList) {
		this.careerVoList = careerVoList;
	}
	public List<ActiveVO> getActiveVoList() {
		return activeVoList;
	}
	public void setActiveVoList(List<ActiveVO> activeVoList) {
		this.activeVoList = activeVoList;
	}
	public List<CertifyVO> getCertifyVoList() {
		return certifyVoList;
	}
	public void setCertifyVoList(List<CertifyVO> certifyVoList) {
		this.certifyVoList = certifyVoList;
	}
	public List<LanguageVO> getLanguageVoList() {
		return languageVoList;
	}
	public void setLanguageVoList(List<LanguageVO> languageVoList) {
		this.languageVoList = languageVoList;
	}
	public List<AwardVO> getAwardVoList() {
		return awardVoList;
	}
	public void setAwardVoList(List<AwardVO> awardVoList) {
		this.awardVoList = awardVoList;
	}
	public AddinfoVO getAddInfoVo() {
		return addInfoVo;
	}
	public void setAddInfoVo(AddinfoVO addInfoVo) {
		this.addInfoVo = addInfoVo;
	}
	public PotfolioVO getPotfolioVo() {
		return potfolioVo;
	}
	public void setPotfolioVo(PotfolioVO potfolioVo) {
		this.potfolioVo = potfolioVo;
	}
	@Override
	public String toString() {
		return "ResumeAllVo [resumeVo=" + resumeVo + ", educationVo=" + educationVo + ", careerVoList=" + careerVoList
				+ ", activeVoList=" + activeVoList + ", certifyVoList=" + certifyVoList + ", languageVoList="
				+ languageVoList + ", awardVoList=" + awardVoList + ", addInfoVo=" + addInfoVo + ", potfolioVo="
				+ potfolioVo + "]";
	}
	
	
}
