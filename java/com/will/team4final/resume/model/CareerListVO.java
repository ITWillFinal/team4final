package com.will.team4final.resume.model;

import java.util.List;

public class CareerListVO {
	private List<CareerVO> careerItems;

	public List<CareerVO> getCareerItems() {
		return careerItems;
	}

	public void setCareerItems(List<CareerVO> careerItems) {
		this.careerItems = careerItems;
	}

	@Override
	public String toString() {
		return "CareerListVO [careerItems=" + careerItems + "]";
	}
}
