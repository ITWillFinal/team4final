package com.will.team4final.gogak.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.common.SearchVO;

@Service
public class FaqCompanyServiceImpl implements FaqCompanyService{

	@Autowired private FaqCompanyDAO faqcompanyDao;
	
	@Override
	public List<FaqCompanyVO> selectFaq(SearchVO searchVo) {
		return faqcompanyDao.selectFaq(searchVo);
	}

	@Override
	public int WriteFaq(FaqCompanyVO vo) {
		return faqcompanyDao.WriteFaq(vo);
	}

	@Override
	public FaqCompanyVO selectByNo(int no) {
		return faqcompanyDao.selectByNo(no);
	}

	@Override
	public int editFaq(FaqCompanyVO vo) {
		return faqcompanyDao.editFaq(vo);
	}

	@Override
	public int deleteFaq(int no) {
		return faqcompanyDao.deleteFaq(no);
	}

	@Override
	public int selectTotalRecord(SearchVO vo) {
		return faqcompanyDao.selectTotalRecord(vo);
	}

	@Override
	@Transactional
	public int deleteMulti(List<FaqCompanyVO> list) {
		int cnt = 0;
		try {
			for(FaqCompanyVO vo : list) {
				if(vo.getfaqNo() != 0) {
					cnt = faqcompanyDao.deleteFaq(vo.getfaqNo());
				}
			}
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public FaqCompanyVO before(int faqNo) {
		return faqcompanyDao.before(faqNo);
	}

	@Override
	public FaqCompanyVO after(int faqNo) {
		return faqcompanyDao.after(faqNo);
	}
	
}