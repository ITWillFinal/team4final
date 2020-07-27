package com.will.team4final.resume.model;

public class CertifyVO {

	private String certifyCode;
	private String certifyName;
	private String certifyPlace;
	private String certifyGetDate;
	private String resumeNo;
	
	
	public String getCertifyCode() {
		return certifyCode;
	}
	public void setCertifyCode(String certifyCode) {
		this.certifyCode = certifyCode;
	}
	public String getCertifyName() {
		return certifyName;
	}
	public void setCertifyName(String certifyName) {
		this.certifyName = certifyName;
	}
	public String getCertifyPlace() {
		return certifyPlace;
	}
	public void setCertifyPlace(String certifyPlace) {
		this.certifyPlace = certifyPlace;
	}
	public String getCertifyGetDate() {
		return certifyGetDate;
	}
	public void setCertifyGetDate(String certifyGetDate) {
		this.certifyGetDate = certifyGetDate;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	@Override
	public String toString() {
		return "CertifyVO [certifyCode=" + certifyCode + ", certifyName=" + certifyName + ", certifyPlace="
				+ certifyPlace + ", certifyGetDate=" + certifyGetDate + ", resumeNo=" + resumeNo + "]";
	}
}
