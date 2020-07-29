package com.will.team4final.scrip.model;

public class ComScrapVO {
	private int scrapNo;
	private String userNo;
	private String recruitmentCode;
	
	public int getScrapNo() {
		return scrapNo;
	}
	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getRecruitmentCode() {
		return recruitmentCode;
	}
	public void setRecruitmentCode(String recruitmentCode) {
		this.recruitmentCode = recruitmentCode;
	}
	
	@Override
	public String toString() {
		return "ComScrapVO [scrapNo=" + scrapNo + ", userNo=" + userNo + ", recruitmentCode=" + recruitmentCode + "]";
	}
	
	
	
}
