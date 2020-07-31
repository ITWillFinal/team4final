package com.will.team4final.payment.model;

public class PaymentVO {
	private String paymentCode;
	private String productName;
	private int price;
	private String startDay;
	private String endDay;
	private String cMemberCode;
	
	
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
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
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
				+ ", startDay=" + startDay + ", endDay=" + endDay + ", cMemberCode=" + cMemberCode + "]";
	}
	
	
	
	
}
