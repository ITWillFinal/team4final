package com.will.team4final.gogak.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.common.SearchVO;

@Service
public class FaqAdminCompanyServiceImpl implements FaqAdminCompanyService{

	@Autowired private FaqAdminCompanyDAO faqcompanyDao;
	
	@Override
	public List<FaqAdminCompanyVO> selectFaq(SearchVO searchVo) {
		return faqcompanyDao.selectFaq(searchVo);
	}

	@Override
	public int WriteFaq(FaqAdminCompanyVO vo) {
		return faqcompanyDao.WriteFaq(vo);
	}

	@Override
	public FaqAdminCompanyVO selectByNo(int no) {
		return faqcompanyDao.selectByNo(no);
	}

	@Override
	public int editFaq(FaqAdminCompanyVO vo) {
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
	public int deleteMulti(List<FaqAdminCompanyVO> list) {
		int cnt = 0;
		try {
			for(FaqAdminCompanyVO vo : list) {
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
	public FaqAdminCompanyVO before(int faqNo) {
		return faqcompanyDao.before(faqNo);
	}

	@Override
	public FaqAdminCompanyVO after(int faqNo) {
		return faqcompanyDao.after(faqNo);
	}
	
}