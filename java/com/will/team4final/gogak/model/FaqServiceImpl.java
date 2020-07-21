package com.will.team4final.gogak.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired private FaqDAO faqDao;
	
	@Override
	public List<FaqVO> selectFaq() {
		return faqDao.selectFaq();
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
	
	
}