package com.will.team4final.notice.model;

import java.util.List;

public class NoticeListVO {
	private List<NoticeVO> listNotice;

	public List<NoticeVO> getListNotice() {
		return listNotice;
	}

	public void setListNotice(List<NoticeVO> listNotice) {
		this.listNotice = listNotice;
	}

	@Override
	public String toString() {
		return "NoticeListVO [listNotice=" + listNotice + "]";
	}
	
	
}
