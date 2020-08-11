package com.will.team4final.chart.model;

public interface ChartDAO {
	public String sumByMonth(String month);
	public String countByMember(String month);
	public String countByMemberC(String month);
	public String countByGenderM();
	public String countByGenderF();
	public String countByAgeM(int age);
	public String countByAgeF(int age);
	public String countByAge(int age);

}
