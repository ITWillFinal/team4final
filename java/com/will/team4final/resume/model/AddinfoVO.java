package com.will.team4final.resume.model;

public class AddinfoVO {

	private String infoCode;
	private String disable;
	private String military;
	private String affair;
	private String sFund;
	private String resumeNo;
	
	public String getInfoCode() {
		return infoCode;
	}
	public void setInfoCode(String infoCode) {
		this.infoCode = infoCode;
	}
	public String getDisable() {
		return disable;
	}
	public void setDisable(String disable) {
		this.disable = disable;
	}
	public String getMilitary() {
		return military;
	}
	public void setMilitary(String military) {
		this.military = military;
	}
	public String getAffair() {
		return affair;
	}
	public void setAffair(String affair) {
		this.affair = affair;
	}
	public String getsFund() {
		return sFund;
	}
	public void setsFund(String sFund) {
		this.sFund = sFund;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	
	@Override
	public String toString() {
		return "AddinfoVO [infoCode=" + infoCode + ", disable=" + disable + ", military=" + military + ", affair="
				+ affair + ", sFund=" + sFund + ", resumeNo=" + resumeNo + "]";
	}
}
