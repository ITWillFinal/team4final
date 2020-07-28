package com.will.team4final.gogak.admin.model;

import java.util.List;

public class FaqAdminListVO {
	private List<FaqAdminVO> faqlist;

	public List<FaqAdminVO> getFaqlist() {
		return faqlist;
	}

	public void setFaqlist(List<FaqAdminVO> faqlist) {
		this.faqlist = faqlist;
	}

	@Override
	public String toString() {
		return "FaqListVO [faqlist=" + faqlist + "]";
	}
	
	
}
