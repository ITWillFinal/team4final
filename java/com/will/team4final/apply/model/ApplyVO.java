package com.will.team4final.apply.model;

public class ApplyVO {

	private String applyCode;
	private String regdate;
	private String applyStatus;
	private String readCheck;
	private String userNo;
	private String recruitmentCode;
	
	
	public String getApplyCode() {
		return applyCode;
	}



	public void setApplyCode(String applyCode) {
		this.applyCode = applyCode;
	}



	public String getRegdate() {
		return regdate;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public String getApplyStatus() {
		return applyStatus;
	}



	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}



	public String getReadCheck() {
		return readCheck;
	}



	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
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
		return "ApplyVO [applyCode=" + applyCode + ", regdate=" + regdate + ", applyStatus=" + applyStatus
				+ ", readCheck=" + readCheck + ", userNo=" + userNo + ", recruitmentCode=" + recruitmentCode + "]";
	}
}
