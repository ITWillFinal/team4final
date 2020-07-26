package com.will.team4final.gogak.model;

import java.util.List;

public class FaqCompanyListVO {
	private List<FaqCompanyVO> faqlist;

	public List<FaqCompanyVO> getFaqlist() {
		return faqlist;
	}

	public void setFaqlist(List<FaqCompanyVO> faqlist) {
		this.faqlist = faqlist;
	}

	@Override
	public String toString() {
		return "FaqListVO [faqlist=" + faqlist + "]";
	}
	
	
}
