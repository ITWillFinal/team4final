package com.will.team4final.company.model;

import java.sql.Timestamp;

public class ComRecruitVO {
	int recruitmentCode;
	String comName;
	String title; 
	String jobType1;
	String jobType2;
	String induType1;
	String induType2;
	String zipcode;
	String address;
	String addressDetail;
	String location1;
	String location2;
	String workHours;
	int pay;
	String recType;
	String welfare;
	String gender;
	int age;
	String educationLv;
	String career;
	String preference;
	int recNumber;
	Timestamp regdate;
	Timestamp recDeadline;
	String document;
	String recDetail;
	int readCount;
	String accuse;
	String category;
	String imgUrl;
	String fileName;
	String fileSize;
	String comCode;
	
	public int getRecruitmentCode() {
		return recruitmentCode;
	}
	public void setRecruitmentCode(int recruitmentCode) {
		this.recruitmentCode = recruitmentCode;
	}
	public String getConName() {
		return comName;
	}
	public void setConName(String conName) {
		this.comName = conName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJobType1() {
		return jobType1;
	}
	public void setJobType1(String jobType1) {
		this.jobType1 = jobType1;
	}
	public String getJobType2() {
		return jobType2;
	}
	public void setJobType2(String jobType2) {
		this.jobType2 = jobType2;
	}
	public String getInduType1() {
		return induType1;
	}
	public void setInduType1(String induType1) {
		this.induType1 = induType1;
	}
	public String getInduType2() {
		return induType2;
	}
	public void setInduType2(String induType2) {
		this.induType2 = induType2;
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
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getWorkHours() {
		return workHours;
	}
	public void setWorkHours(String workHours) {
		this.workHours = workHours;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getRecType() {
		return recType;
	}
	public void setRecType(String recType) {
		this.recType = recType;
	}
	public String getWelfare() {
		return welfare;
	}
	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEducationLv() {
		return educationLv;
	}
	public void setEducationLv(String educationLv) {
		this.educationLv = educationLv;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getPreference() {
		return preference;
	}
	public void setPreference(String preference) {
		this.preference = preference;
	}
	public int getRecNumber() {
		return recNumber;
	}
	public void setRecNumber(int recNumber) {
		this.recNumber = recNumber;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getRecDeadline() {
		return recDeadline;
	}
	public void setRecDeadline(Timestamp recDeadline) {
		this.recDeadline = recDeadline;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public String getRecDetail() {
		return recDetail;
	}
	public void setRecDetail(String recDetail) {
		this.recDetail = recDetail;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getAccuse() {
		return accuse;
	}
	public void setAccuse(String accuse) {
		this.accuse = accuse;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	
	@Override
	public String toString() {
		return "ComRecruitVO [recruitmentCode=" + recruitmentCode + ", comName=" + comName + ", title=" + title
				+ ", jobType1=" + jobType1 + ", jobType2=" + jobType2 + ", induType1=" + induType1 + ", induType2="
				+ induType2 + ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail
				+ ", location1=" + location1 + ", location2=" + location2 + ", workHours=" + workHours + ", pay=" + pay
				+ ", recType=" + recType + ", welfare=" + welfare + ", gender=" + gender + ", age=" + age
				+ ", educationLv=" + educationLv + ", career=" + career + ", preference=" + preference + ", recNumber="
				+ recNumber + ", regdate=" + regdate + ", recDeadline=" + recDeadline + ", document=" + document
				+ ", recDetail=" + recDetail + ", readCount=" + readCount + ", accuse=" + accuse + ", category="
				+ category + ", imgUrl=" + imgUrl + ", fileName=" + fileName + ", fileSize=" + fileSize + ", comCode="
				+ comCode + "]";
	}	
	
}