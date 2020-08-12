package com.will.team4final.payment.model;

public class PaymentVO {
	private String paymentCode;
	private String productName;
	private int price;
	private String regdate;
	private String cMemberCode;
	private String recruitmentCode;
	
	
	public String getRecruitmentCode() {
		return recruitmentCode;
	}
	public void setRecruitmentCode(String recruitmentCode) {
		this.recruitmentCode = recruitmentCode;
	}
	public String getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getcMemberCode() {
		return cMemberCode;
	}
	public void setcMemberCode(String cMemberCode) {
		this.cMemberCode = cMemberCode;
	}
	@Override
	public String toString() {
		return "PaymentVO [paymentCode=" + paymentCode + ", productName=" + productName + ", price=" + price
				+ ", regdate=" + regdate + ", cMemberCode=" + cMemberCode + ", recruitmentCode=" + recruitmentCode
				+ "]";
	}
	
	
}
