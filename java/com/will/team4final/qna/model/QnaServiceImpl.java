package com.will.team4final.qna.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.team4final.common.SearchVO;
import com.will.team4final.qnare.model.QnareDAO;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired private QnaDAO qnaDao;
	@Autowired private QnareDAO qnareDao;

	@Override
	public List<QnaVO> selectQna(SearchVO searchVo) {
		return qnaDao.selectQna(searchVo);
	}

	@Override
	public int WriteQna(QnaVO qnavo) {
		return qnaDao.WriteQna(qnavo);
	}

	@Override
	public int selectTotalRecord(SearchVO vo) {
		return qnaDao.selectTotalRecord(vo);
	}

	@Override
	public int editQna(QnaVO vo) {
		return qnaDao.editQna(vo);
	}

	@Override
	public int deleteQna(int no) {
		return qnaDao.deleteQna(no);
	}

	@Override
	@Transactional
	public int deleteMulti(List<QnaVO> list) {
		int cnt = 0;
		int cntre = 0;
		try {
			for(QnaVO vo : list) {
				if(vo.getQnaNo() != 0) {
					cntre = qnareDao.replyDel(vo.getQnaNo());
					cnt = qnaDao.deleteQna(vo.getQnaNo());
				}
			}
		}catch(RuntimeException e) {
			cntre=-1;
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public QnaVO before(int qnaNo) {
		return qnaDao.before(qnaNo);
	}

	@Override
	public QnaVO after(int qnaNo) {
		return qnaDao.after(qnaNo);
	}

	@Override
	public QnaVO selectByNo(int no) {
		return qnaDao.selectByNo(no);
	}

	@Override
	public int noRe() {
		int qna = qnaDao.countQna();
		int join = qnaDao.countJoin();
		
		int rst = qna-join;
		
		return rst;
	}
	
	

}
