package com.will.team4final.jobkinds.model;

import java.util.List;
import java.util.Map;

public interface JobDAO {
	List<Map<String, Object>> selectLarge();
	List<Map<String, Object>> selectInduLarge();
	List<Map<String, Object>> selectJobMiddle(int no);
	
}
