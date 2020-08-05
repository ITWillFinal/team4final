package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service
public class ComRecruitServiceImpl implements ComRecruitService {
	@Autowired 
	private ComRecruitDAO comRecruitDao;

	@Override
	public int insertComRecruit(ComRecruitVO comRecruitVo) {
		return comRecruitDao.insertComRecruit(comRecruitVo);
	}

	@Override
	public List<Map<String, Object>> selectMost5() {
		return comRecruitDao.selectMost5();
	}

	@Override
	public ComRecruitVO selectOneCom(String recruitmentCode) {
		return comRecruitDao.selectOneCom(recruitmentCode);
	}

	@Override
	public String selectrecruitmentCode() {
		return comRecruitDao.selectrecruitmentCode();
	}

	@Override
	public ComRecruitVO selectBycomCode(String comCode) {
		return comRecruitDao.selectBycomCode(comCode);
	}

	@Override
	public int updateResumeType(ComRecruitVO comRecruitVo) {
		return comRecruitDao.updateResumeType(comRecruitVo);
	}

	@Override
	public List<ComRecruitVO> selectListBycomCode(ComRecruitSearchVO comRecruitSearchVO) {
		return comRecruitDao.selectListBycomCode(comRecruitSearchVO);
	}

	@Override
	public int selectTotalRecord(ComRecruitSearchVO comRecruitSearchVO) {
		return comRecruitDao.selectTotalRecord(comRecruitSearchVO);
	}

	@Override
	@Transactional
	public int deleteMulti(List<ComRecruitVO> list) {
		int cnt = 0;
		try {
			for(ComRecruitVO vo : list) {
				if("0".equals(vo.getRecruitmentCode())) {
					cnt = comRecruitDao.deleteComRecruit(vo.getRecruitmentCode());
				}
			}
			
		}catch(RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	
}
