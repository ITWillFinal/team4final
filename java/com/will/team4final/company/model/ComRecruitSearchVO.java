package com.will.team4final.company.model;

import com.will.team4final.common.SearchVO;

public class ComRecruitSearchVO extends SearchVO{
	private String comCode;

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "ComRecruitSearchVO [comCode=" + comCode + ", getSearchCondition()=" + getSearchCondition()
				+ ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()=" + getSearchUseYn()
				+ ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

	
	
	
	
	
}