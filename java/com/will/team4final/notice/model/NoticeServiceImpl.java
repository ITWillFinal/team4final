package com.will.team4final.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}

	@Override
	@Transactional
	public int deleteMultiNotice(List<NoticeVO> list) {
		int cnt = 0;
		
		try {
			for(NoticeVO vo : list) {
				if(vo.getNoticeNo() != 0) {
					cnt = noticeDao.deleteNotice(vo.getNoticeNo());
				}
			}
		}catch (RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}
	

}
