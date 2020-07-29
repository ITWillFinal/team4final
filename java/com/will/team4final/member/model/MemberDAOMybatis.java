package com.will.team4final.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.SearchVO;

@Repository
public class MemberDAOMybatis implements MemberDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.will.team4final.member.";

	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert(namespace+"insertMember", vo);
	}

	@Override
	public int selectMemberDup(String userid) {
		return sqlSession.selectOne(namespace + "selectMemberDup", userid);
	}

	@Override
	public String findId(String email) {
		return sqlSession.selectOne(namespace + "findId", email);
	}

	@Override
	public int updatePwdByEmail(MemberVO memberVo) {
		return sqlSession.update(namespace + "updatePwdByEmail", memberVo);
	}

	@Override
	public MemberVO selectByUserid(String user_id) {
		return sqlSession.selectOne(namespace+"selectByUserid", user_id);
	}

	@Override
	public String selectMemberPwd(String userid) {
		return sqlSession.selectOne(namespace + "selectMemberPwd", userid);
	}

	@Override
	public List<MemberVO> showAllMemberUser(SearchVO searchvo) {
		return sqlSession.selectList(namespace + "showAllMemberUser", searchvo);
	}

	@Override
	public int deleteUser(int userNo) {
		return sqlSession.delete(namespace+"deleteUser", userNo);
	}

	@Override
	public MemberVO selectByUerNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectByUerNo", userNo);
	}

	@Override
	public int selectTotalRecordOfMember(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordOfMember", searchVo);
	}

	@Override
	public List<MemberVO> showMemberListByDate(DateSearchVO dateSearchVo) {
		return sqlSession.selectList(namespace + "showMemberListByDate", dateSearchVo );
	}
	
	

	

}
