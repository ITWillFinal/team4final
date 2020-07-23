package com.will.team4final.resume.model;

public class ResumeVO {
	private String resumeNo;
	private String userNo;
	private String education;
	private String career;
	private String location1;
	private String location2;
	private String jobType1;
	private String jobType2;
	private String sal;
	private String activity;
	private String certificate;
	private String special;
	private String portfolioFile;
	private String portfolio;
	private String selfIntTitle;
	private String selfInt;
	private String regdate;
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getJobType1() {
		return jobType1;
	}
	public void setJobType1(String jobType1) {
		this.jobType1 = jobType1;
	}
	public String getJobType2() {
		return jobType2;
	}
	public void setJobType2(String jobType2) {
		this.jobType2 = jobType2;
	}
	public String getSal() {
		return sal;
	}
	public void setSal(String sal) {
		this.sal = sal;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	public String getPortfolioFile() {
		return portfolioFile;
	}
	public void setPortfolioFile(String portfolioFile) {
		this.portfolioFile = portfolioFile;
	}
	public String getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}
	public String getSelfIntTitle() {
		return selfIntTitle;
	}
	public void setSelfIntTitle(String selfIntTitle) {
		this.selfIntTitle = selfIntTitle;
	}
	public String getSelfInt() {
		return selfInt;
	}
	public void setSelfInt(String selfInt) {
		this.selfInt = selfInt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ResumeVO [resumeNo=" + resumeNo + ", userNo=" + userNo + ", education=" + education + ", career="
				+ career + ", location1=" + location1 + ", location2=" + location2 + ", jobType1=" + jobType1
				+ ", jobType2=" + jobType2 + ", sal=" + sal + ", activity=" + activity + ", certificate=" + certificate
				+ ", special=" + special + ", portfolioFile=" + portfolioFile + ", portfolio=" + portfolio
				+ ", selfIntTitle=" + selfIntTitle + ", selfInt=" + selfInt + ", regdate=" + regdate + "]";
	}

}
