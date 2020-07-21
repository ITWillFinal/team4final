package com.will.team4final.gogak.model;

import java.util.List;

public interface FaqService {
	public List<FaqVO> selectFaq();
	public int WriteFaq(FaqVO vo);
	public FaqVO selectByNo(int no);
	public int editFaq(FaqVO vo);
	public int deleteFaq(int no);



}
