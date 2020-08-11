package com.will.team4final.payment.model;

public interface PaymentDAO {
	int insertPayment(PaymentVO paymentVo);
	String selectTodayPayment();
}
