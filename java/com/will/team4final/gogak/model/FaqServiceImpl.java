package com.will.team4final.gogak.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.common.SearchVO;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired private FaqDAO faqDao;
	
	@Override
	public List<FaqVO> selectFaq(SearchVO searchVo) {
		return faqDao.selectFaq(searchVo);
	}

	@Override
	public int WriteFaq(FaqVO vo) {
		return faqDao.WriteFaq(vo);
	}

	@Override
	public FaqVO selectByNo(int no) {
		return faqDao.selectByNo(no);
	}

	@Override
	public int editFaq(FaqVO vo) {
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
	public int deleteMulti(List<FaqVO> list) {
		int cnt = 0;
		try {
			for(FaqVO vo : list) {
				if(vo.getFnqNo() != 0) {
					cnt = faqDao.deleteFaq(vo.getFnqNo());
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
	public FaqVO before(int fnqNo) {
		return faqDao.before(fnqNo);
	}

	@Override
	public FaqVO after(int fnqNo) {
		return faqDao.after(fnqNo);
	}
	
}