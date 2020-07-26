package com.will.team4final.gogak.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.common.SearchVO;

@Service
public class FaqAdminServiceImpl implements FaqAdminService{

	@Autowired private FaqAdminDAO faqDao;
	
	@Override
	public List<FaqAdminVO> selectFaq(SearchVO searchVo) {
		return faqDao.selectFaq(searchVo);
	}

	@Override
	public int WriteFaq(FaqAdminVO vo) {
		return faqDao.WriteFaq(vo);
	}

	@Override
	public FaqAdminVO selectByNo(int no) {
		return faqDao.selectByNo(no);
	}

	@Override
	public int editFaq(FaqAdminVO vo) {
		return faqDao.editFaq(vo);
	}

	@Override
	public int deleteFaq(int no) {
		return faqDao.deleteFaq(no);
	}

	@Override
	public int selectTotalRecord(SearchVO vo) {
		return faqDao.selectTotalRecord(vo);
	}

	@Override
	@Transactional
	public int deleteMulti(List<FaqAdminVO> list) {
		int cnt = 0;
		try {
			for(FaqAdminVO vo : list) {
				if(vo.getfaqNo() != 0) {
					cnt = faqDao.deleteFaq(vo.getfaqNo());
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
	public FaqAdminVO before(int faqNo) {
		return faqDao.before(faqNo);
	}

	@Override
	public FaqAdminVO after(int faqNo) {
		return faqDao.after(faqNo);
	}
	
}