package com.will.team4final.resume.model;

import java.util.List;

public class LanguageListVO {

	private List<LanguageVO> languageItems;

	public List<LanguageVO> getLanguageItems() {
		return languageItems;
	}

	public void setLanguageItems(List<LanguageVO> languageItems) {
		this.languageItems = languageItems;
	}

	@Override
	public String toString() {
		return "LanguageListVO [languageItems=" + languageItems + "]";
	}
}
