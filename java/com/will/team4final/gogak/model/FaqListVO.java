package com.will.team4final.gogak.model;

import java.util.List;

public class FaqListVO {
	private List<FaqVO> faqlist;

	public List<FaqVO> getFaqlist() {
		return faqlist;
	}

	public void setFaqlist(List<FaqVO> faqlist) {
		this.faqlist = faqlist;
	}

	@Override
	public String toString() {
		return "FaqListVO [faqlist=" + faqlist + "]";
	}
	
	
}
