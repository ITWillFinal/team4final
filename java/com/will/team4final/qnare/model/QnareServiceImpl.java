package com.will.team4final.qnare.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnareServiceImpl implements QnareService{
	
	@Autowired QnareDAO qnareDao;

	@Override
	public QnareVO selectRe(int qnaNo) {
		return qnareDao.selectRe(qnaNo);
	}

	@Override
	public int reCount(int qnaNo) {
		int rst;
		if(qnareDao.reCount(qnaNo)<1) {
			rst = none;
		}else {
			rst = done;
		}
		return rst;
	}

	@Override
	public int replyWrite(QnareVO revo) {
		return qnareDao.replyWrite(revo);
	}

	@Override
	public int replyDel(int qnaNo) {
		return qnareDao.replyDel(qnaNo);
	}

	@Override
	public int replyEdit(QnareVO qnareVo) {
		return qnareDao.replyEdit(qnareVo);
	}

	@Override
	public QnareVO selectByNo(int qnaNo) {
		return qnareDao.selectByNo(qnaNo);
	}
	
	

}
