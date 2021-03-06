package com.will.team4final.member.model;

public class MemberVO {
	private String userNo;
	private String userid;
	private String pwd;
	private String userName;
	private String imageURL;
	private String nickname;
	private String birth;
	private String gender;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String email;
	private String hp;
	private String regdate;
	private String outdate;
	private String userStatus;
	private String resumeNo;
	private String yorn;
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getOutdate() {
		return outdate;
	}
	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getYorn() {
		return yorn;
	}
	public void setYorn(String yorn) {
		this.yorn = yorn;
	}
	@Override
	public String toString() {
		return "MemberVO [userNo=" + userNo + ", userid=" + userid + ", pwd=" + pwd + ", userName=" + userName
				+ ", imageURL=" + imageURL + ", nickname=" + nickname + ", birth=" + birth + ", gender=" + gender
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", email="
				+ email + ", hp=" + hp + ", regdate=" + regdate + ", outdate=" + outdate + ", userStatus=" + userStatus
				+ ", resumeNo=" + resumeNo + ", yorn=" + yorn + "]";
	}
	
	
}
