package com.will.team4final.payment.model;

import java.util.List;

public interface PaymentService {
	int insertPayment(PaymentVO paymentVo);
	String selectTodayPayment();
}
