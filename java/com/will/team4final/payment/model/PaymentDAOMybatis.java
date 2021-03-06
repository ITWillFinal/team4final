package com.will.team4final.payment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.SearchVO;

@Repository
public class PaymentDAOMybatis implements PaymentDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.payment.";

	@Override
	public int insertPayment(PaymentVO paymentVo) {
		return sqlSession.insert(namespace+"insertPayment", paymentVo);
	}

	@Override
	public String selectTodayPayment() {
		return sqlSession.selectOne(namespace + "selectTodayPayment");
	}

	@Override
	public List<Map<String, Object>> selectPaymentAdmin(DateSearchVO dateSearchVo) {
		return sqlSession.selectList(namespace+"selectPaymentAdmin", dateSearchVo);
	}

	@Override
	public int selectTotalRecordAdmin(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordAdmin", dateSearchVo);
	}

	@Override
	public List<Map<String, Object>> selectPaymentC(SearchVO searchvo) {
		return sqlSession.selectList(namespace+"selectPaymentC", searchvo);
	}

	@Override
	public int selectTotalRecordC(SearchVO searchvo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordC", searchvo);
	}
	
	public List<Map<String, Object>> selectPamentForView() {
		return sqlSession.selectList(namespace + "selectPamentForView");
	}

	@Override
	public String selectTotalPriceAdmin(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalPriceAdmin", dateSearchVo);
	}

	@Override
	public String selectTotalPriceC(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalPriceC", dateSearchVo);
	}

	@Override
	public String selectThis(String month) {
		return sqlSession.selectOne(namespace+"selectThis", month);
	}

	@Override
	public String selectBefore(String month) {
		return sqlSession.selectOne(namespace+"selectBefore", month);
	}
	
	public PaymentVO selectByrecruitmentCode(String recruitmentCode) {
		return sqlSession.selectOne(namespace+"selectByrecruitmentCode",recruitmentCode );
	}

	@Override
	public int updatePrice(PaymentVO paymentVo) {
		return sqlSession.update(namespace+"updatePrice", paymentVo);
	}
}
