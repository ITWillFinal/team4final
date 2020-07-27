package com.will.team4final.resume.model;

import java.util.List;

public class AwardListVO {
	private List<AwardVO> awardItems;

	public List<AwardVO> getAwardItems() {
		return awardItems;
	}

	public void setAwardItems(List<AwardVO> awardItems) {
		this.awardItems = awardItems;
	}

	@Override
	public String toString() {
		return "AwardListVO [awardItems=" + awardItems + "]";
	}

}
