package com.will.team4final.gogak.model;

public class FaqVO {
	private int fnqNo;
	private String category;
	private String question;
	private String answer;
	
	public int getFnqNo() {
		return fnqNo;
	}
	public void setFnqNo(int fnqNo) {
		this.fnqNo = fnqNo;
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
	
	@Override
	public String toString() {
		return "FnqVO [fnq_no=" + fnqNo + ", category=" + category + ", question=" + question + ", answer=" + answer
				+ "]";
	}
	
}
