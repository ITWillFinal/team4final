package com.will.team4final.gogak.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface FaqService {
	public List<FaqVO> selectFaq(SearchVO searchvo);
	public int WriteFaq(FaqVO vo);
	public FaqVO selectByNo(int no);
	public int editFaq(FaqVO vo);
	public int deleteFaq(int no);
	public int selectTotalRecord(SearchVO vo);



}
