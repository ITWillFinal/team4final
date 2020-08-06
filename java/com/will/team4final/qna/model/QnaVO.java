package com.will.team4final.qna.model;

import java.sql.Timestamp;

public class QnaVO {
	private int qnaNo;
	private String userId;
	private String title;
	private int categoryNO;
	private String content;
	private Timestamp regDate;
	private String fileName;
	private int fileSize;
	private String originFileName;
	private String status; 
	private int no;
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCategoryNO() {
		return categoryNO;
	}
	public void setCategoryNO(int categoryNO) {
		this.categoryNO = categoryNO;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "qnaVO [qnaNo=" + qnaNo +", userId=" + userId + ", title=" + title
				+ ", categoryNO=" + categoryNO + ", content=" + content + ", regDate=" + regDate + ", fileName="
				+ fileName + ", fileSize=" + fileSize + ", originFileName=" + originFileName + ", status=" + status + ", no=" + no + "]";
	}
	
}
