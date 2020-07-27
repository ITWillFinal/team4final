package com.will.team4final.resume.model;

import java.util.List;

public class ActiveListVO {

	private List<ActiveVO> activeItems;

	public List<ActiveVO> getActiveItems() {
		return activeItems;
	}

	public void setActiveItems(List<ActiveVO> activeItems) {
		this.activeItems = activeItems;
	}

	@Override
	public String toString() {
		return "ActiveListVO [activeItems=" + activeItems + "]";
	}
	
}
