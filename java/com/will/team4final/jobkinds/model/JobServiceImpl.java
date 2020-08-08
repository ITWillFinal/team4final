package com.will.team4final.jobkinds.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.team4final.company.model.Recruitment_TosVO;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobDAO jobDao;
	
	@Override
	public List<Map<String, Object>> selectLarge() {
		return jobDao.selectLarge();
	}

	@Override
	public List<Map<String, Object>> selectInduLarge() {
		return jobDao.selectInduLarge();
	}

	@Override
	public List<Map<String, Object>> selectJobMiddle(int no) {
		return jobDao.selectJobMiddle(no);
	}

	@Override
	public List<Map<String, Object>> selectInduMiddle(int no) {
		return jobDao.selectInduMiddle(no);
	}

	@Override
	public String selectJobLargeName(String jobType) {
		return jobDao.selectJobLargeName(jobType);
	}

	@Override
	public String selectInduLargeName(String induType) {
		return jobDao.selectInduLargeName(induType);
	}

	@Override
	public List<Recruitment_TosVO> selectDetailByJobType(String jobType2) {
		return jobDao.selectDetailByJobType(jobType2);
	}

	@Override
	public List<Recruitment_TosVO> selectDetailByInduType(String induType2) {
		return jobDao.selectDetailByInduType(induType2);
	}
	
}
