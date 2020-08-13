package com.will.team4final.payment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.SearchVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired private PaymentDAO paymentDao;
	
	@Override
	public int insertPayment(PaymentVO paymentVo) {
		return paymentDao.insertPayment(paymentVo);
	}

	@Override
	public String selectTodayPayment() {
		return paymentDao.selectTodayPayment();
	}

	@Override
	public List<Map<String, Object>> selectPayment(SearchVO searchvo) {
		return paymentDao.selectPayment(searchvo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchvo) {
		return paymentDao.selectTotalRecord(searchvo);
	}

	@Override
	public List<Map<String, Object>> selectPaymentC(SearchVO searchvo) {
		return paymentDao.selectPaymentC(searchvo);
	}

	@Override
	public int selectTotalRecordC(SearchVO searchvo) {
		return paymentDao.selectTotalRecordC(searchvo);
	}
	
	@Override
	public int selectTotalPrice(DateSearchVO dateSearchV) {
		return paymentDao.selectTotalPrice(dateSearchV);
	}
	
	public List<Map<String, Object>> selectPamentForView() {
		return paymentDao.selectPamentForView();
	}

	@Override
	public PaymentVO selectByrecruitmentCode(String recruitmentCode) {
		return paymentDao.selectByrecruitmentCode(recruitmentCode);
	}

	@Override
	public int updatePrice(PaymentVO paymentVo) {
		return paymentDao.updatePrice(paymentVo);
	}
}
