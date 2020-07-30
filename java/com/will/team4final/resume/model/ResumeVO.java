package com.will.team4final.resume.model;

public class ResumeVO {
	private String resumeNo;
	private String userNo;
	private String location1;
	private String location2;
	private String jobtype1;
	private String jobtype2;
	private String sal;
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
	public String getJobtype1() {
		return jobtype1;
	}
	public void setJobtype1(String jobtype1) {
		this.jobtype1 = jobtype1;
	}
	public String getJobtype2() {
		return jobtype2;
	}
	public void setJobtype2(String jobtype2) {
		this.jobtype2 = jobtype2;
	}
	public String getSal() {
		return sal;
	}
	public void setSal(String sal) {
		this.sal = sal;
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
		return "ResumeVO [resumeNo=" + resumeNo + ", userNo=" + userNo + ", location1=" + location1 + ", location2="
				+ location2 + ", jobtype1=" + jobtype1 + ", jobtype2=" + jobtype2 + ", sal=" + sal + ", selfIntTitle="
				+ selfIntTitle + ", selfInt=" + selfInt + ", regdate=" + regdate + "]";
	}

	
}
