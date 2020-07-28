package com.will.team4final.resume.model;

public class CareerVO {

	private String careerCode;
	private String careerCompany;
	private String careerPeriod;
	private String careerReason;
	private String task;
	private String resumeNo;
	private String careerRank;
	private String careerYear;
	private String careerLocation;
	private String careerSal;
	
	public String getCareerCode() {
		return careerCode;
	}
	public void setCareerCode(String careerCode) {
		this.careerCode = careerCode;
	}
	public String getCareerCompany() {
		return careerCompany;
	}
	public void setCareerCompany(String careerCompany) {
		this.careerCompany = careerCompany;
	}
	public String getCareerPeriod() {
		return careerPeriod;
	}
	public void setCareerPeriod(String careerPeriod) {
		this.careerPeriod = careerPeriod;
	}
	public String getCareerReason() {
		return careerReason;
	}
	public void setCareerReason(String careerReason) {
		this.careerReason = careerReason;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getCareerRank() {
		return careerRank;
	}
	public void setCareerRank(String careerRank) {
		this.careerRank = careerRank;
	}
	public String getCareerYear() {
		return careerYear;
	}
	public void setCareerYear(String careerYear) {
		this.careerYear = careerYear;
	}
	public String getCareerLocation() {
		return careerLocation;
	}
	public void setCareerLocation(String careerLocation) {
		this.careerLocation = careerLocation;
	}
	public String getCareerSal() {
		return careerSal;
	}
	public void setCareerSal(String careerSal) {
		this.careerSal = careerSal;
	}
	
	@Override
	public String toString() {
		return "CareerVO [careerCode=" + careerCode + ", careerCompany=" + careerCompany + ", careerPeriod="
				+ careerPeriod + ", careerReason=" + careerReason + ", task=" + task + ", resumeNo=" + resumeNo
				+ ", careerRank=" + careerRank + ", careerYear=" + careerYear + ", careerLocation=" + careerLocation
				+ ", careerSal=" + careerSal + "]";
	}
	
	
}
