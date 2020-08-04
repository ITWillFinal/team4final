package com.will.team4final.memberAdmin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;

@Repository
public class MemberAdminDAOMybatis implements MemberAdminDAO{
	
	@Autowired private SqlSessionTemplate sqlsession;
	
	private String namespace = "com.mybatis.mapper.oracle.memberAdmin.";

	@Override
	public int selectIdDup(String adminId) {
		return sqlsession.selectOne(namespace+"selectIdDup", adminId);
	}

	@Override
	public int insertAdmin(MemberAdminVO vo) {
		return sqlsession.insert(namespace+"insertAdmin", vo);
	}

	@Override
	public String selectMemberPwd(String adminId) {
		return sqlsession.selectOne(namespace+"selectMemberPwd", adminId);
	}

	@Override
	public MemberAdminVO selectByUserid(String adminId) {
		return sqlsession.selectOne(namespace+"selectByUserid", adminId);
	}

	@Override
	public String selectLevel(String adminId) {
		return sqlsession.selectOne(namespace+"selectLevel", adminId);
	}

	@Override
	public List<MemberLevelVO> levels() {
		return sqlsession.selectList(namespace+"levels");
	}

	@Override
	public List<MemberAdminVO> selectInfo(SearchVO searchVo) {
		return sqlsession.selectList(namespace+"selectInfo", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlsession.selectOne(namespace+"selectTotalRecord", searchVo);
	}

	@Override
	public int deleteAdmin(int adminNo) {
		return sqlsession.delete(namespace+"deleteAdmin", adminNo);
	}

	@Override
	public int updateLevel(MemberAdminVO vo) {
		return sqlsession.update(namespace+"updateLevel", vo);
	}

	@Override
	public MemberAdminVO selectByNO(int adminNo) {
		return sqlsession.selectOne(namespace+"selectByNO", adminNo);
	}

}
