package com.will.team4final.resume.model;

public class PotfolioVO {

	private String potCode;
	private String potFile;
	private String potPeriod;
	private String potTools;
	private String workers;
	private String intro;
	private String resumeNo;
	
	public String getPotCode() {
		return potCode;
	}
	public void setPotCode(String potCode) {
		this.potCode = potCode;
	}
	public String getPotFile() {
		return potFile;
	}
	public void setPotFile(String potFile) {
		this.potFile = potFile;
	}
	public String getPotPeriod() {
		return potPeriod;
	}
	public void setPotPeriod(String potPeriod) {
		this.potPeriod = potPeriod;
	}
	public String getPotTools() {
		return potTools;
	}
	public void setPotTools(String potTools) {
		this.potTools = potTools;
	}
	public String getWorkers() {
		return workers;
	}
	public void setWorkers(String workers) {
		this.workers = workers;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	@Override
	public String toString() {
		return "PotfolioVO [potCode=" + potCode + ", potFile=" + potFile + ", potPeriod=" + potPeriod + ", potTools="
				+ potTools + ", workers=" + workers + ", intro=" + intro + ", resumeNo=" + resumeNo + "]";
	}
	
}
