package com.will.team4final.location.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationServiceImpl implements LocationService{
	
	@Autowired
	LocationDAO locaDao;

	@Override
	public List<String> sido() {
		return locaDao.sido();
	}

	@Override
	public List<LocationVO> selectAllLocation() {
		return locaDao.selectAllLocation();
	}

	@Override
	public List<String> selectSigugun(String sido) {
		return locaDao.selectSigugun(sido);
	}
	
}
