package com.will.team4final.payment.model;

import java.util.List;
import java.util.Map;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.SearchVO;

public interface PaymentDAO {
	int insertPayment(PaymentVO paymentVo);
	String selectTodayPayment();
	List<Map<String, Object>>selectPayment(SearchVO searchvo);
	public int selectTotalRecord(SearchVO searchvo);
	List<Map<String, Object>>selectPaymentC(SearchVO searchvo);
	public int selectTotalRecordC(SearchVO searchvo);
	public int selectTotalPrice(DateSearchVO dateSearchVo);
	List<Map<String, Object>> selectPamentForView();
	PaymentVO selectByrecruitmentCode(String recruitmentCode);
	int updatePrice(PaymentVO paymentVo);
}
