package com.will.team4final.resume.model;

import java.util.List;

public class CertifyListVO {

	private List<CertifyVO> certifyItems;

	public List<CertifyVO> getCertifyItems() {
		return certifyItems;
	}

	public void setCertifyItems(List<CertifyVO> certifyItems) {
		this.certifyItems = certifyItems;
	}

	@Override
	public String toString() {
		return "CertifyListVO [certifyItems=" + certifyItems + "]";
	}

}
