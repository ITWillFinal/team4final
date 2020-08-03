package com.will.team4final.payment.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOMybatis implements PaymentDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.payment.";

	@Override
	public int insertPayment(PaymentVO paymentVo) {
		return sqlSession.insert(namespace+"insertPayment", paymentVo);
	}
}
