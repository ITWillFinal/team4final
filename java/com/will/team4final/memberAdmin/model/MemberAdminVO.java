package com.will.team4final.memberAdmin.model;

import java.sql.Timestamp;

public class MemberAdminVO {
	private int adminNo;
	private String adminId;
	private String pwd;
	private String adminName;
	private String tel;
	private int levels;
	private Timestamp regDate;
	
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getLevels() {
		return levels;
	}
	public void setLevels(int levels) {
		this.levels = levels;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "MemberAdminVO [adminNo=" + adminNo + ", adminId=" + adminId + ", pwd=" + pwd + ", adminName="
				+ adminName + ", tel=" + tel + ", levels=" + levels + ", regDate=" + regDate + "]";
	}

}
