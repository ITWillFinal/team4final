package com.will.team4final.company.resume.model;

public class CompanyResumeUseVO {

	String recruitmentCode;
	String userId;
	String name;
	String gender;
	String email;
	String hp;
	String birth;
	String zipcode;
	String address;
	String addressDetail;
	String edu;
	String career;
	String certificate;
	String language;
	String award;
	String special;
	String activity;
	String self;
	public String getRecruitmentCode() {
		return recruitmentCode;
	}
	public void setRecruitmentCode(String recruitmentCode) {
		this.recruitmentCode = recruitmentCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
	}
	@Override
	public String toString() {
		return "CompanyResumeUseVO [recruitmentCode=" + recruitmentCode + ", userId=" + userId + ", name=" + name
				+ ", gender=" + gender + ", email=" + email + ", hp=" + hp + ", birth=" + birth + ", zipcode=" + zipcode
				+ ", address=" + address + ", addressDetail=" + addressDetail + ", edu=" + edu + ", career=" + career
				+ ", certificate=" + certificate + ", language=" + language + ", award=" + award + ", special="
				+ special + ", activity=" + activity + ", self=" + self + "]";
	}
	
}
