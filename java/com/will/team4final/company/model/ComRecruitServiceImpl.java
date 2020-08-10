package com.will.team4final.company.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.scrap.model.ComScrapVO;

@Service
public class ComRecruitServiceImpl implements ComRecruitService {
	@Autowired
	private ComRecruitDAO comRecruitDao;

	@Override
	public int insertComRecruit(ComRecruitVO comRecruitVo) {
		return comRecruitDao.insertComRecruit(comRecruitVo);
	}

	@Override
	public List<Recruitment_TosVO> selectMost5() {
		return comRecruitDao.selectMost5();
	}

	@Override
	public Recruitment_TosVO selectOneCom(String recruitmentCode) {
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
	public List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo) {
		return comRecruitDao.recruitmentDetailList(comRecruitVo);
	}

	public List<ComRecruitVO> selectListBycomCode(String comCode) {
		return comRecruitDao.selectListBycomCode(comCode);
	}

	@Override
	public List<Recruitment_TosVO> selectScrapList(List<ComScrapVO> scrapList) {
		List<Recruitment_TosVO> list = new ArrayList<Recruitment_TosVO>();
		for (int i = 0; i < scrapList.size(); i++) {
			ComScrapVO comScrap = scrapList.get(i);
			Recruitment_TosVO rectuitVo = comRecruitDao.selectTosOneCom(comScrap.getRecruitmentCode());
			list.add(rectuitVo);
		}
		return list;
	}

	@Override
	public int updateReadCount(String recruitmentCode) {
		return comRecruitDao.updateReadCount(recruitmentCode);
	}

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
			for (ComRecruitVO vo : list) {
				cnt = comRecruitDao.deleteComRecruit(vo.getRecruitmentCode());
			}

		} catch (RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return cnt;
	}

	@Override
	public Recruitment_TosVO selectTosOneCom(String recruitmentCode) {
		return comRecruitDao.selectTosOneCom(recruitmentCode);
	}

	@Override
	public List<ComRecruitVO> selectAllRecruitment() {
		return comRecruitDao.selectAllRecruitment();
	}

	public int updateComRecruit(ComRecruitVO vo) {
		return comRecruitDao.updateComRecruit(vo);
	}

	@Override
	public ComRecruitVO selectOneByRecruitmentCode(String recruitmentCode) {
		return comRecruitDao.selectOneByRecruitmentCode(recruitmentCode);
	}

	@Override
	public int deleteOne(String recruitmentCode) {
		return comRecruitDao.deleteComRecruit(recruitmentCode);
	}

	@Override
	public List<Recruitment_TosVO> selectHot100() {
		return comRecruitDao.selectHot100();
	}

	@Override
	public List<Recruitment_TosVO> selectList_tosByComcode(String comCode) {
		return comRecruitDao.selectList_tosByComcode(comCode);
	}
}
