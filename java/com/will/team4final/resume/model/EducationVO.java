package com.will.team4final.resume.model;

public class EducationVO {

	private String eduCode;
	private String finalEdu;
	private String uni;
	private String uniName;
	private String eduLocation;
	private String eduPeriod;
	private String major;
	private String eduScore;
	private String resumeNo;
	
	public String getEduCode() {
		return eduCode;
	}
	public void setEduCode(String eduCode) {
		this.eduCode = eduCode;
	}
	public String getFinalEdu() {
		return finalEdu;
	}
	public void setFinalEdu(String finalEdu) {
		this.finalEdu = finalEdu;
	}
	public String getUni() {
		return uni;
	}
	public void setUni(String uni) {
		this.uni = uni;
	}
	public String getUniName() {
		return uniName;
	}
	public void setUniName(String uniName) {
		this.uniName = uniName;
	}
	public String getEduLocation() {
		return eduLocation;
	}
	public void setEduLocation(String eduLocation) {
		this.eduLocation = eduLocation;
	}
	public String getEduPeriod() {
		return eduPeriod;
	}
	public void setEduPeriod(String eduPeriod) {
		this.eduPeriod = eduPeriod;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEduScore() {
		return eduScore;
	}
	public void setEduScore(String eduScore) {
		this.eduScore = eduScore;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	
	@Override
	public String toString() {
		return "EducationVO [eduCode=" + eduCode + ", finalEdu=" + finalEdu + ", uni=" + uni + ", uniName=" + uniName
				+ ", eduLocation=" + eduLocation + ", eduPeriod=" + eduPeriod + ", major=" + major + ", eduScore="
				+ eduScore + ", resumeNo=" + resumeNo + "]";
	}
}
