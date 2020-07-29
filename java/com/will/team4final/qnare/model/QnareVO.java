package com.will.team4final.qnare.model;

import java.sql.Timestamp;

public class QnareVO {
	private int no;
	private String name;
	private Timestamp regDate;
	private String content;
	private int qnaNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	
	@Override
	public String toString() {
		return "QnareVO [no=" + no + ", name=" + name + ", regDate=" + regDate + ", content=" + content + ", qnaNo="
				+ qnaNo + "]";
	}
	
	
}
