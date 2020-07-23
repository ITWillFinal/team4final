package com.will.team4final.resume.model;

public class ResumeVO {
	private int resumeNo;
	private int userNo;
	private String location1;
	private String location2;
	private String location3;
	private String jobType1;
	private String jobType2;
	private String jobType3;
	private int sal;
	private String resumeTitle;
	private String selfInt;
	private String education;
	private String REGDATE;
	
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	public String getLocation3() {
		return location3;
	}
	public void setLocation3(String location3) {
		this.location3 = location3;
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
	public String getJobType3() {
		return jobType3;
	}
	public void setJobType3(String jobType3) {
		this.jobType3 = jobType3;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getSelfInt() {
		return selfInt;
	}
	public void setSelfInt(String selfInt) {
		this.selfInt = selfInt;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}
	
	@Override
	public String toString() {
		return "ResumeVO [resumeNo=" + resumeNo + ", userNo=" + userNo + ", location1=" + location1 + ", location2="
				+ location2 + ", location3=" + location3 + ", jobType1=" + jobType1 + ", jobType2=" + jobType2
				+ ", jobType3=" + jobType3 + ", sal=" + sal + ", resumeTitle=" + resumeTitle + ", selfInt=" + selfInt
				+ ", education=" + education + ", REGDATE=" + REGDATE + "]";
	}
}
