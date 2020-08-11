package com.will.team4final.payment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Map<String, Object>> selectPayment(SearchVO searchvo) {
		return sqlSession.selectList(namespace+"selectPayment", searchvo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchvo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchvo);
	}

	@Override
	public List<Map<String, Object>> selectPamentForView() {
		return sqlSession.selectList(namespace + "selectPamentForView");
	}
}
