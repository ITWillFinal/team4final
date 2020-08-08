package com.will.team4final.scrap.model;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
@Service
public class ComScrapServiceImpl implements ComScrapService {
	
	@Autowired
	private ComScrapDAO comScrapDao;

	@Override
	public int insertComScrap(ComScrapVO comVo) {
		return comScrapDao.insertComScrap(comVo);
	}

	@Override
	public int selectComScrapById(ComScrapVO comVo) {
		return comScrapDao.selectComScrapById(comVo);
	}

	@Override
	public int deleteScrap(ComScrapVO comVo) {
		return comScrapDao.deleteScrap(comVo);
	}

	@Override
	public int selectComScrapNum(String userNo) {
		return comScrapDao.selectComScrapNum(userNo);
	}

	@Override
	public List<ComScrapVO> selectComScrapInfo(String userNo) {
		return comScrapDao.selectComScrapInfo(userNo);
	}

	@Override
	@Transactional
	public int deleteMulti(List<ComScrapVO> list) {
		int cnt=0;
		try {
			for(ComScrapVO vo : list) {
				cnt = comScrapDao.deleteByrecruitmentCode(vo.getRecruitmentCode());
			}
			
		}catch (RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteOne(String recruitmentCode) {
		return comScrapDao.deleteByrecruitmentCode(recruitmentCode);
	}
	
	
}
