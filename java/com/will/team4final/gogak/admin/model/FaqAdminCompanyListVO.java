package com.will.team4final.gogak.admin.model;

import java.util.List;

public class FaqAdminCompanyListVO {
	private List<FaqAdminCompanyVO> faqlist;

	public List<FaqAdminCompanyVO> getFaqlist() {
		return faqlist;
	}

	public void setFaqlist(List<FaqAdminCompanyVO> faqlist) {
		this.faqlist = faqlist;
	}

	@Override
	public String toString() {
		return "FaqListVO [faqlist=" + faqlist + "]";
	}
	
	
}
