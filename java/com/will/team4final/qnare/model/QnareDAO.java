package com.will.team4final.qnare.model;

public interface QnareDAO {
	public QnareVO selectRe(int qnaNo);
	public int reCount(int qnaNo);
	public int replyWrite(QnareVO revo);
	public int replyDel(int qnaNo);
	public int replyEdit(QnareVO qnareVo);
	public QnareVO selectByNo(int qnaNo);

}
