package com.will.team4final.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.team4final.common.SearchVO;


@Repository
public class NoticeDAOMybatis implements NoticeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.will.team4final.notice.";
	
	public int insertNotice(NoticeVO vo) {
		return sqlSession.insert(namespace + "insertNotice", vo);
	}

	@Override
	public List<NoticeVO> selectAllNotice(SearchVO searchVo) {
		return sqlSession.selectList(namespace + "selectAllNotice", searchVo);
	}

	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) {
		return sqlSession.selectOne(namespace + "selectNoticeByNo", noticeNo);
	}

	@Override
	public int totalNotice(SearchVO searchVo) {
		return sqlSession.selectOne(namespace + "totalNotice", searchVo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete(namespace + "deleteNotice", noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return sqlSession.update(namespace + "updateNotice", vo);
	}

	@Override
	public List<NoticeVO> selectMemberNotice(SearchVO searchVo) {
		return sqlSession.selectList(namespace + "selectMemberNotice", searchVo);
	}

	@Override
	public int totalMemberNotice(SearchVO searchVo) {
		return sqlSession.selectOne(namespace + "totalMemberNotice", searchVo);
	}

	@Override
	public List<NoticeVO> selectComNotice(SearchVO searchVo) {
		return sqlSession.selectList(namespace + "selectComNotice", searchVo);
	}

	@Override
	public int totalComNotice(SearchVO searchVo) {
		return sqlSession.selectOne(namespace + "totalComNotice", searchVo);
	}

	@Override
	public int updateNoticeReadcount(int noticeNo) {
		return sqlSession.update(namespace + "updateNoticeReadcount", noticeNo);
	}
	

}
