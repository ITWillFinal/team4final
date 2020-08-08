package com.will.team4final.location.model;

import java.util.List;

import com.will.team4final.company.model.Recruitment_TosVO;

public interface LocationService {
	List<String> sido();
	List<String> selectSigugun(String sido);
	List<LocationVO> selectAllLocation();
	List<Recruitment_TosVO> selectHireInfoByLocation(String location);
}
