package com.will.team4final.qna.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface QnaDAO {
	public List<QnaVO> selectQna(SearchVO searchVo);
	public int WriteQna(QnaVO qnavo);
	public QnaVO selectByNo(int no);
	public int selectTotalRecord(SearchVO vo);
	public int editQna(QnaVO vo);
	public int deleteQna(int no);
	public QnaVO before(int qnaNo);
	public QnaVO after(int qnaNo);

}
