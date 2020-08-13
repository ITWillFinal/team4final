package com.will.team4final.qna.model;

import java.util.List;

import com.will.team4final.common.DateSearchVO;

public interface QnaDAO {
	public List<QnaVO> selectQna(DateSearchVO searchVo);
	public int WriteQna(QnaVO qnavo);
	public QnaVO selectByNo(int no);
	public int selectTotalRecord(DateSearchVO vo);
	public int editQna(QnaVO vo);
	public int deleteQna(int no);
	public QnaVO before(int qnaNo);
	public QnaVO after(int qnaNo);
	public int countJoin();
	public int countQna();
	public int selectTotalRecordAdmin(DateSearchVO vo);
	public List<QnaVO> selectQnaAdmin(DateSearchVO searchVo);

}
