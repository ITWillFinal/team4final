package com.will.team4final.company.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComRecruitDAOMybatis implements ComRecruitDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "com.will.team4final.companyRecruit.";

	@Override
	public int insertComRecruit(ComRecruitVO comRecruitVo) {
		return sqlSession.insert(namespace + "insertComRecruit", comRecruitVo);
	}

	@Override
	public List<Recruitment_TosVO> selectMost5() {
		return sqlSession.selectList(namespace + "selectMost5");
	}

	@Override
	public Recruitment_TosVO selectOneCom(String recruitmentCode) {
		return sqlSession.selectOne(namespace + "selectOneCom", recruitmentCode);
	}

	@Override
	public String selectrecruitmentCode() {
		return sqlSession.selectOne(namespace + "selectrecruitmentCode");
	}

	@Override
	public ComRecruitVO selectBycomCode(String comCode) {
		return sqlSession.selectOne(namespace + "selectBycomCode", comCode);
	}

	@Override
	public int updateResumeType(ComRecruitVO comRecruitVo) {
		return sqlSession.update(namespace + "updateResumeType", comRecruitVo);
	}

	@Override
	public List<ComRecruitVO> recruitmentDetailList(ComRecruitVO comRecruitVo) {
		return sqlSession.selectList(namespace + "recruitmentDetailList", comRecruitVo);
	}

	public List<ComRecruitVO> selectListBycomCode(String comCode) {
		return sqlSession.selectList(namespace + "selectListBycomCode", comCode);
	}

	@Override
	public int updateReadCount(String recruitmentCode) {
		return sqlSession.update(namespace + "updateReadCount", recruitmentCode);
	}

	public List<ComRecruitVO> selectListBycomCode(ComRecruitSearchVO comRecruitSearchVO) {
		return sqlSession.selectList(namespace + "selectListBycomCode", comRecruitSearchVO);
	}

	@Override
	public int selectTotalRecord(ComRecruitSearchVO comRecruitSearchVO) {
		return sqlSession.selectOne(namespace + "selectTotalRecord", comRecruitSearchVO);
	}

	@Override
	public int deleteComRecruit(String no) {
		return sqlSession.delete(namespace + "deleteComRecruit", no);
	}

	@Override
	public Recruitment_TosVO selectTosOneCom(String recruitmentCode) {
		return sqlSession.selectOne(namespace + "selectTosOneCom", recruitmentCode);
	}

	@Override
	public List<ComRecruitVO> selectAllRecruitment() {
		return sqlSession.selectList(namespace + "selectAllRecruitment");
	}

	public int updateComRecruit(ComRecruitVO vo) {
		return sqlSession.update(namespace + "updateComRecruit", vo);
	}

	@Override
	public ComRecruitVO selectOneByRecruitmentCode(String recruitmentCode) {
		return sqlSession.selectOne(namespace + "selectOneByRecruitmentCode", recruitmentCode);
	}

	@Override
	public List<Recruitment_TosVO> selectHot100() {
		return sqlSession.selectList(namespace + "selectHot100");
	}

	@Override
	public List<Recruitment_TosVO> selectList_tosByComcode(String comCode) {
		return sqlSession.selectList(namespace+"selectList_tosByComcode", comCode);
	}

}
