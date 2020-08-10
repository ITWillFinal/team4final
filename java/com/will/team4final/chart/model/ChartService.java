package com.will.team4final.chart.model;

public interface ChartService {
	public int sumByMonth(String month);
	public int countByMember(String month);
	public int countByMemberC(String month);
	public int countByGenderM();
	public int countByGenderF();
	public int countByAgeM(int age);
	public int countByAgeF(int age);
	public int countByAge(int age);

}
