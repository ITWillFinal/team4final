package com.will.team4final.location.model;

public class LocationVO {
	private String sido;
	private String sigugun;
	
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigugun() {
		return sigugun;
	}
	public void setSigugun(String sigugun) {
		this.sigugun = sigugun;
	}
	
	@Override
	public String toString() {
		return "LocationVO [sido=" + sido + ", sigugun=" + sigugun + "]";
	}
		
	
}
