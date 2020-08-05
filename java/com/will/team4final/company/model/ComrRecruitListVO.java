package com.will.team4final.company.model;

import java.util.List;

public class ComrRecruitListVO {
	private List<ComRecruitVO> comrRecruitList;

	public List<ComRecruitVO> getComrRecruitList() {
		return comrRecruitList;
	}

	public void setComrRecruitList(List<ComRecruitVO> comrRecruitList) {
		this.comrRecruitList = comrRecruitList;
	}

	@Override
	public String toString() {
		return "ComrRecruitListVO [comrRecruitList=" + comrRecruitList + "]";
	}
	
	
}
