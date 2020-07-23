package com.will.team4final.location.model;

import java.util.List;

public interface LocationDAO {
	List<String> sido();
	List<String> selectSigugun(String sido);
	List<LocationVO> selectAllLocation();
}
