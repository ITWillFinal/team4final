package com.will.team4final.payment.model;

import java.util.List;
import java.util.Map;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.SearchVO;

public interface PaymentService {
	int insertPayment(PaymentVO paymentVo);
	String selectTodayPayment();
	List<Map<String, Object>>selectPaymentAdmin(DateSearchVO dateSearchVo);
	public int selectTotalRecordAdmin(DateSearchVO dateSearchVo);
	List<Map<String, Object>>selectPaymentC(SearchVO searchvo);
	public int selectTotalRecordC(SearchVO searchvo);
	List<Map<String, Object>> selectPamentForView();
	public String selectTotalPriceAdmin(DateSearchVO dateSearchVo);
	public String selectTotalPriceC(DateSearchVO dateSearchVo);
	public String selectThis(String month);
	public String selectBefore(String month);
}
