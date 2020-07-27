package com.will.team4final.resume.model;

public class AwardVO {

	private String awardCode;
	private String awardName;
	private String awardCom;
	private String awardGetDate;
	private String resumeNo;
	
	public String getAwardCode() {
		return awardCode;
	}
	public void setAwardCode(String awardCode) {
		this.awardCode = awardCode;
	}
	public String getAwardName() {
		return awardName;
	}
	public void setAwardName(String awardName) {
		this.awardName = awardName;
	}
	public String getAwardCom() {
		return awardCom;
	}
	public void setAwardCom(String awardCom) {
		this.awardCom = awardCom;
	}
	public String getAwardGetDate() {
		return awardGetDate;
	}
	public void setAwardGetDate(String awardGetDate) {
		this.awardGetDate = awardGetDate;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	@Override
	public String toString() {
		return "AwardVO [awardCode=" + awardCode + ", awardName=" + awardName + ", awardCom=" + awardCom
				+ ", awardGetDate=" + awardGetDate + ", resumeNo=" + resumeNo + "]";
	}
	
}
