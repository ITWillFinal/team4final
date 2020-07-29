package com.will.team4final.company.model;

import java.util.List;

public interface ComRecruitService {
	int insertComRecruit(ComRecruitVO comRecruitVo);
	List<ComRecruitVO> selectMost5();
}
