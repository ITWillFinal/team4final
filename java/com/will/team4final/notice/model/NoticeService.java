package com.will.team4final.notice.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface NoticeService {
	int insertNotice(NoticeVO vo);
	List<NoticeVO> selectAllNotice(SearchVO searchVo);
	NoticeVO selectNoticeByNo(int noticeNo);
	public int totalNotice(SearchVO searchVo);
	int deleteNotice(int noticeNo);
	int deleteMultiNotice(List<NoticeVO> list);
	int updateNotice(NoticeVO vo);
	List<NoticeVO> selectMemberNotice(SearchVO searchVo);
	int totalMemberNotice(SearchVO searchVo);
	List<NoticeVO> selectComNotice(SearchVO searchVo);
	int totalComNotice(SearchVO searchVo);
	int updateNoticeReadcount(int noticeNo);
}
