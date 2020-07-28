package com.will.team4final.gogak.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface FaqCompanyService {
	public List<FaqCompanyVO> selectFaq(SearchVO searchvo);
	public int WriteFaq(FaqCompanyVO vo);
	public FaqCompanyVO selectByNo(int no);
	public int editFaq(FaqCompanyVO vo);
	public int deleteFaq(int no);
	public int selectTotalRecord(SearchVO vo);
	int deleteMulti(List<FaqCompanyVO>list);
	public FaqCompanyVO before(int faqNo);
	public FaqCompanyVO after(int faqNo);



}
