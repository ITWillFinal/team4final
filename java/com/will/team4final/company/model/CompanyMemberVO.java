package com.will.team4final.company.model;

public class CompanyMemberVO {
	private int cMemberCode;
	private String cUserid;
	private String cPwd;
	private String cUsername;
	private String cNickname;
	private String cBirth;
	private String cGender;
	private String cEmail;
	private String cHp;
	private String cJoindate;
	private String cOutdate;
	private String cUserStatus;
	
	public int getcMemberCode() {
		return cMemberCode;
	}
	public void setcMemberCode(int cMemberCode) {
		this.cMemberCode = cMemberCode;
	}
	public String getcUserid() {
		return cUserid;
	}
	public void setcUserid(String cUserid) {
		this.cUserid = cUserid;
	}
	public String getcPwd() {
		return cPwd;
	}
	public void setcPwd(String cPwd) {
		this.cPwd = cPwd;
	}
	public String getcUsername() {
		return cUsername;
	}
	public void setcUsername(String cUsername) {
		this.cUsername = cUsername;
	}
	public String getcNickname() {
		return cNickname;
	}
	public void setcNickname(String cNickname) {
		this.cNickname = cNickname;
	}
	public String getcBirth() {
		return cBirth;
	}
	public void setcBirth(String cBirth) {
		this.cBirth = cBirth;
	}
	public String getcGender() {
		return cGender;
	}
	public void setcGender(String cGender) {
		this.cGender = cGender;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getcHp() {
		return cHp;
	}
	public void setcHp(String cHp) {
		this.cHp = cHp;
	}
	public String getcJoindate() {
		return cJoindate;
	}
	public void setcJoindate(String cJoindate) {
		this.cJoindate = cJoindate;
	}
	public String getcOutdate() {
		return cOutdate;
	}
	public void setcOutdate(String cOutdate) {
		this.cOutdate = cOutdate;
	}
	public String getcUserStatus() {
		return cUserStatus;
	}
	public void setcUserStatus(String cUserStatus) {
		this.cUserStatus = cUserStatus;
	}
	
	@Override
	public String toString() {
		return "CompanyMemberVO [cMemberCode=" + cMemberCode + ", cUserid=" + cUserid + ", cPwd=" + cPwd
				+ ", cUsername=" + cUsername + ", cNickname=" + cNickname + ", cBirth=" + cBirth + ", cGender="
				+ cGender + ", cEmail=" + cEmail + ", cHp=" + cHp + ", cJoindate=" + cJoindate + ", cOutdate="
				+ cOutdate + ", cUserStatus=" + cUserStatus + "]";
	}
	
}
