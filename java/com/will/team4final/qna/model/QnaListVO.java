package com.will.team4final.qna.model;

import java.util.List;

public class QnaListVO {
	private List<QnaVO> qnaList;

	public List<QnaVO> getQnaList() {
		return qnaList;
	}

	public void setQnaList(List<QnaVO> qnaList) {
		this.qnaList = qnaList;
	}

	@Override
	public String toString() {
		return "qnaListVO [qnaList=" + qnaList + "]";
	}
	
	

}
