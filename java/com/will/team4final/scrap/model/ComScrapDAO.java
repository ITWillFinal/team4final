package com.will.team4final.scrap.model;

import java.util.List;

public interface ComScrapDAO {
	int insertComScrap(ComScrapVO comVo);
	int selectComScrapById(ComScrapVO comVo);
	int deleteScrap(ComScrapVO comVo);
	int selectComScrapNum(String userNo);
	List<ComScrapVO> selectComScrapInfo(String userNo);
	int deleteByrecruitmentCode(String recruitmentCode);
	
}
