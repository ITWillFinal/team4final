package com.will.team4final.resume.model;

public class ResumeTalentVO {
	private String resumeNo;
	private String userName;
	private String finalEdu;
	private String careerYear;
	private String selfIntTitle;
	private String sal;
	private String jobtype1;
	private String jobtype2;
	private String location1;
	private String location2;
	
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFinalEdu() {
		return finalEdu;
	}
	public void setFinalEdu(String finalEdu) {
		this.finalEdu = finalEdu;
	}

	public String getCareerYear() {
		return careerYear;
	}
	public void setCareerYear(String careerYear) {
		this.careerYear = careerYear;
	}
	public String getSelfIntTitle() {
		return selfIntTitle;
	}
	public void setSelfIntTitle(String selfIntTitle) {
		this.selfIntTitle = selfIntTitle;
	}
	public String getSal() {
		return sal;
	}
	public void setSal(String sal) {
		this.sal = sal;
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
	@Override
	public String toString() {
		return "ResumeTalentVO [resumeNo=" + resumeNo + ", userName=" + userName + ", finalEdu=" + finalEdu + 
				", careerYear=" + careerYear + ", selfIntTitle=" + selfIntTitle + ", sal=" + sal + ", jobtype1="
				+ jobtype1 + ", jobtype2=" + jobtype2 + ", location1=" + location1 + ", location2=" + location2 + "]";
	}
}
