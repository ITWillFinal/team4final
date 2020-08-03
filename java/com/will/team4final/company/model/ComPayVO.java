package com.will.team4final.company.model;

public class ComPayVO {
    int payCode;
    String productName;
    int price;
    String startDate;
    String endDate;
    String comCode;
    
    public int getPayCode() {
		return payCode;
	}
    
	public void setPayCode(int payCode) {
		this.payCode = payCode;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "ComPayVO [payCode=" + payCode + ", productName=" + productName + ", price=" + price + ", startDate="
				+ startDate + ", endDate=" + endDate + ", comCode=" + comCode + "]";
	}
    
}
