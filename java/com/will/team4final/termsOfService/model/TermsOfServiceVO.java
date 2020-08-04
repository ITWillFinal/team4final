package com.will.team4final.termsOfService.model;

public class TermsOfServiceVO {
	private String serviceCode;
	private String startDate;
	private String endDate;
	private String recruitmentCode;
	
	
	
	public String getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRecruitmentCode() {
		return recruitmentCode;
	}
	public void setRecruitmentCode(String recruitmentCode) {
		this.recruitmentCode = recruitmentCode;
	}
	@Override
	public String toString() {
		return "TermsOfServiceVO [serviceCode=" + serviceCode + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", recruitmentCode=" + recruitmentCode + "]";
	}

	
	
}
