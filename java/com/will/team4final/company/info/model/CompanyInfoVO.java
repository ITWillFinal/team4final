package com.will.team4final.company.info.model;

public class CompanyInfoVO {
	private int comCode;
	private String comName;
	private String ceo;
	private String comNum;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String imageURL;
	private String comHp;
	private String comType;
	private String comIndustry;
	private String content;
	private String homepage;
	private String review;
	private int cMemberCode;
	public int getComCode() {
		return comCode;
	}
	public void setComCode(int comCode) {
		this.comCode = comCode;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getComNum() {
		return comNum;
	}
	public void setComNum(String comNum) {
		this.comNum = comNum;
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
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getComHp() {
		return comHp;
	}
	public void setComHp(String comHp) {
		this.comHp = comHp;
	}
	public String getComType() {
		return comType;
	}
	public void setComType(String comType) {
		this.comType = comType;
	}
	public String getComIndustry() {
		return comIndustry;
	}
	public void setComIndustry(String comIndustry) {
		this.comIndustry = comIndustry;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getcMemberCode() {
		return cMemberCode;
	}
	public void setcMemberCode(int cMemberCode) {
		this.cMemberCode = cMemberCode;
	}
	@Override
	public String toString() {
		return "CompanyInfoVO [comCode=" + comCode + ", comName=" + comName + ", ceo=" + ceo + ", comNum=" + comNum
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", imageURL="
				+ imageURL + ", comHp=" + comHp + ", comType=" + comType + ", comIndustry=" + comIndustry + ", content="
				+ content + ", homepage=" + homepage + ", review=" + review + ", cMemberCode=" + cMemberCode + "]";
	}
	
	
	

}
