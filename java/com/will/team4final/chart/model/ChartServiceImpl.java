package com.will.team4final.chart.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartServiceImpl implements ChartService{
	
	@Autowired private ChartDAO chartDao;

	@Override
	public int sumByMonth(String month) {
		return chartDao.sumByMonth(month);
	}

	@Override
	public int countByMember(String month) {
		return chartDao.countByMember(month);
	}

	@Override
	public int countByMemberC(String month) {
		return chartDao.countByMemberC(month);
	}

}
