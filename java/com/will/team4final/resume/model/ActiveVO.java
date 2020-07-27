package com.will.team4final.resume.model;

public class ActiveVO {

	private String actCode;
	private String activity;
	private String actPlace;
	private String actPeriod;
	private String actContent;
	private String resumeNo;
	
	public String getActCode() {
		return actCode;
	}
	public void setActCode(String actCode) {
		this.actCode = actCode;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getActPlace() {
		return actPlace;
	}
	public void setActPlace(String actPlace) {
		this.actPlace = actPlace;
	}
	public String getActPeriod() {
		return actPeriod;
	}
	public void setActPeriod(String actPeriod) {
		this.actPeriod = actPeriod;
	}
	public String getActContent() {
		return actContent;
	}
	public void setActContent(String actContent) {
		this.actContent = actContent;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	@Override
	public String toString() {
		return "ActiveVO [actCode=" + actCode + ", activity=" + activity + ", actPlace=" + actPlace + ", actPeriod="
				+ actPeriod + ", actContent=" + actContent + ", resumeNo=" + resumeNo + "]";
	}
	
	
}
