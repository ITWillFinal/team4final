package com.will.team4final.chart.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartServiceImpl implements ChartService{
	
	@Autowired private ChartDAO chartDao;

	@Override
	public String sumByMonth(String month) {
		return chartDao.sumByMonth(month);
	}

	@Override
	public String countByMember(String month) {
		return chartDao.countByMember(month);
	}

	@Override
	public String countByMemberC(String month) {
		return chartDao.countByMemberC(month);
	}

	@Override
	public String countByGenderM() {
		return chartDao.countByGenderM();
	}

	@Override
	public String countByGenderF() {
		return chartDao.countByGenderF();
	}

	@Override
	public String countByAgeM(int age) {
		return chartDao.countByAgeM(age);
	}

	@Override
	public String countByAgeF(int age) {
		return chartDao.countByAgeF(age);
	}

	@Override
	public String countByAge(int age) {
		return chartDao.countByAge(age);
	}

}
