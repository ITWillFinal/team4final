package com.will.team4final.qna.model;

import java.util.List;

import com.will.team4final.common.DateSearchVO;

public interface QnaService {
	public List<QnaVO> selectQna(DateSearchVO searchVo);
	public int WriteQna(QnaVO qnavo);
	public QnaVO selectByNo(int no);
	public int selectTotalRecord(DateSearchVO vo);
	public int editQna(QnaVO vo);
	public int deleteQna(int no);
	int deleteMulti(List<QnaVO>list);
	public QnaVO before(int qnaNo);
	public QnaVO after(int qnaNo);
	public int noRe();
	public int selectTotalRecordAdmin(DateSearchVO vo);
	public List<QnaVO> selectQnaAdmin(DateSearchVO searchVo);
	

}
