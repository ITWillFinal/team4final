package com.will.team4final.gogak.admin.model;

public class FaqAdminCompanyVO {
	private int faqNo;
	private String category;
	private String question;
	private String answer;
	private String classify;
	
	public int getfaqNo() {
		return faqNo;
	}
	public void setfaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", category=" + category + ", question=" + question + ", answer=" + answer
				+ ", classify=" + classify + "]";
	}
	
	
	
	
	
}
