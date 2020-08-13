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
	public List<Map<String, Object>> selectPaymentAdmin(DateSearchVO dateSearchVo) {
		return paymentDao.selectPaymentAdmin(dateSearchVo);
	}

	@Override
	public int selectTotalRecordAdmin(DateSearchVO dateSearchVo) {
		return paymentDao.selectTotalRecordAdmin(dateSearchVo);
	}

	@Override
	public List<Map<String, Object>> selectPaymentC(SearchVO searchvo) {
		return paymentDao.selectPaymentC(searchvo);
	}

	@Override
	public int selectTotalRecordC(SearchVO searchvo) {
		return paymentDao.selectTotalRecordC(searchvo);
	}
	
	public List<Map<String, Object>> selectPamentForView() {
		return paymentDao.selectPamentForView();
	}

	@Override
	public String selectTotalPriceAdmin(DateSearchVO dateSearchVo) {
		return paymentDao.selectTotalPriceAdmin(dateSearchVo);
	}

	@Override
	public String selectTotalPriceC(DateSearchVO dateSearchVo) {
		return paymentDao.selectTotalPriceC(dateSearchVo);
	}

	@Override
	public String selectThis(String month) {
		return paymentDao.selectThis(month);
	}

	@Override
	public String selectBefore(String month) {
		return paymentDao.selectBefore(month);
	}
}
