package com.will.team4final.memberAdmin.model;

import java.util.List;

public class memberAdminListVO {
	private List<MemberAdminVO> malist;

	public List<MemberAdminVO> getMalist() {
		return malist;
	}

	public void setMalist(List<MemberAdminVO> malist) {
		this.malist = malist;
	}

	@Override
	public String toString() {
		return "memberAdminListVO [malist=" + malist + "]";
	}
	
}
