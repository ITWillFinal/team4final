package com.will.team4final.payment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
