package com.will.team4final.gogak.admin.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface FaqAdminService {
	public List<FaqAdminVO> selectFaq(SearchVO searchvo);
	public int WriteFaq(FaqAdminVO vo);
	public FaqAdminVO selectByNo(int no);
	public int editFaq(FaqAdminVO vo);
	public int deleteFaq(int no);
	public int selectTotalRecord(SearchVO vo);
	int deleteMulti(List<FaqAdminVO>list);
	public FaqAdminVO before(int faqNo);
	public FaqAdminVO after(int faqNo);



}
