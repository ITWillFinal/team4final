package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComRecruitDAOMybatis implements ComRecruitDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.companyRecruit.";
	
	@Override
	public int insertComRecruit(ComRecruitVO comRecruitVo) {
		return sqlSession.insert(namespace + "insertComRecruit", comRecruitVo);
	}

	@Override
	public List<Map<String, Object>> selectMost5() {
		return sqlSession.selectList(namespace + "selectMost5");
	}

	@Override
	public ComRecruitVO selectOneCom(String recruitmentCode) {
		return sqlSession.selectOne(namespace + "selectOneCom", recruitmentCode);
	}

	@Override
	public String selectrecruitmentCode() {
		return sqlSession.selectOne(namespace+"selectrecruitmentCode");
	}

	@Override
	public ComRecruitVO checkRecruitmentCode(String comCode) {
		return sqlSession.selectOne(namespace +"checkRecruitmentCode", comCode);
	}

	@Override
	public int updateResumeType(ComRecruitVO comRecruitVo) {
		return sqlSession.update(namespace+"updateResumeType", comRecruitVo);
	}

	@Override
	public List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo) {
		return sqlSession.selectList(namespace + "recruitmentDetailList", comRecruitVo);
	}
	
	
}
