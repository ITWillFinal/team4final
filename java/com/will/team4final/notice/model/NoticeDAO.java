package com.will.team4final.notice.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface NoticeDAO {
	int insertNotice(NoticeVO vo);
	List<NoticeVO> selectAllNotice(SearchVO searchVo);
	NoticeVO selectNoticeByNo(int noticeNo);
	int totalNotice(SearchVO searchVo);
	int deleteNotice(int noticeNo);
	int updateNotice(NoticeVO vo);
}
