package com.will.team4final.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.apply.model.ApplyVO;
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
	public List<MemberVO> showAllMemberUser(SearchVO searchVo) {
		return sqlSession.selectList(namespace + "showAllMemberUser", searchVo);
	}

	@Override
	public int deleteUser(String userNo) {
		return sqlSession.delete(namespace+"deleteUser", userNo);
	}

	@Override
	public MemberVO selectByUerNo(String userNo) {
		return sqlSession.selectOne(namespace+"selectByUerNo", userNo);
	}

	@Override
	public int changeResumeNo(MemberVO memberVo) {
		return sqlSession.update(namespace+"changeResumeNo",memberVo);
	}

	@Override
	public int changeYorn(MemberVO memberVo) {
		return sqlSession.update(namespace+"changeYorn",memberVo);
	}
	
	public int selectTotalRecordOfMember(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordOfMember", searchVo);
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		return sqlSession.update(namespace+"updateMember", memberVo);
	}

	@Override
	public List<MemberVO> showMemberForExcel() {
		return sqlSession.selectList(namespace + "showMemberForExcel");
	}

	@Override
	public List<ApplyVO> selectApplyByuserNo(String userNo) {
		return sqlSession.selectList(namespace+"selectApplyByuserNo", userNo);
	}

}
