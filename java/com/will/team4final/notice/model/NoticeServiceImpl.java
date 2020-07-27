package com.will.team4final.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.team4final.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDao;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		return noticeDao.insertNotice(vo);
	}

	@Override
	public List<NoticeVO> selectAllNotice(SearchVO searchVo) {
		return noticeDao.selectAllNotice(searchVo);
	}

	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) {
		return noticeDao.selectNoticeByNo(noticeNo);
	}

	@Override
	public int totalNotice(SearchVO searchVo) {
		return noticeDao.totalNotice(searchVo);
	}
	

}
