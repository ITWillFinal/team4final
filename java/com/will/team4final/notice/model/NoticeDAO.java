package com.will.team4final.notice.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface NoticeDAO {
	int insertNotice(NoticeVO vo);
	NoticeVO selectNoticeByNo(int noticeNo);
	List<NoticeVO> selectAllNotice(SearchVO searchVo);
	int totalNotice(SearchVO searchVo);
	List<NoticeVO> selectMemberNotice(SearchVO searchVo);
	int totalMemberNotice(SearchVO searchVo);
	List<NoticeVO> selectComNotice(SearchVO searchVo);
	int totalComNotice(SearchVO searchVo);
	int deleteNotice(int noticeNo);
	int updateNotice(NoticeVO vo);
	int updateNoticeReadcount(int noticeNo);
}
