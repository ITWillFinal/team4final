package com.will.team4final.resume.model;

public class LanguageVO {
	private String langCode;
	private String kinds;
	private String testName;
	private String langScore;
	private String rating;
	private String langGetDate;
	private String resumeName;
	
	public String getLangCode() {
		return langCode;
	}
	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getLangScore() {
		return langScore;
	}
	public void setLangScore(String langScore) {
		this.langScore = langScore;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getLangGetDate() {
		return langGetDate;
	}
	public void setLangGetDate(String langGetDate) {
		this.langGetDate = langGetDate;
	}
	public String getResumeName() {
		return resumeName;
	}
	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}
	@Override
	public String toString() {
		return "LanguageVO [langCode=" + langCode + ", kinds=" + kinds + ", testName=" + testName + ", langScore="
				+ langScore + ", rating=" + rating + ", langGetDate=" + langGetDate + ", resumeName=" + resumeName
				+ "]";
	}
	
	
}
