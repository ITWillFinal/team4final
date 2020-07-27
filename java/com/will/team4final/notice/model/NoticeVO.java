package com.will.team4final.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private	int noticeNo;
	private String title;
	private String type;
	private String content;
	private int readcount;
	private	Timestamp regdate;
	private String filename;
	private long filesize;
	private String originfilename;
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public String getOriginfilename() {
		return originfilename;
	}
	public void setOriginfilename(String originfilename) {
		this.originfilename = originfilename;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", title=" + title + ", type=" + type + ", content=" + content
				+ ", readcount=" + readcount + ", regdate=" + regdate + ", filename=" + filename + ", filesize="
				+ filesize + ", originfilename=" + originfilename + "]";
	}
	
}
