package com.will.team4final.qnare.model;

public interface QnareService {
	public static final int none=0;//답변 없음
	public static final int done=1;//답변 있음
	
	public QnareVO selectRe(int qnaNo);
	public int reCount(int qnaNo);
	public int replyWrite(QnareVO revo);
	public int replyDel(int qnaNo);
	public int replyEdit(QnareVO qnareVo);
	public QnareVO selectByNo(int qnaNo);

}
