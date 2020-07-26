package com.will.team4final.gogak.admin.model;

import java.util.List;

import com.will.team4final.common.SearchVO;

public interface FaqAdminCompanyService {
	public List<FaqAdminCompanyVO> selectFaq(SearchVO searchvo);
	public int WriteFaq(FaqAdminCompanyVO vo);
	public FaqAdminCompanyVO selectByNo(int no);
	public int editFaq(FaqAdminCompanyVO vo);
	public int deleteFaq(int no);
	public int selectTotalRecord(SearchVO vo);
	int deleteMulti(List<FaqAdminCompanyVO>list);
	public FaqAdminCompanyVO before(int faqNo);
	public FaqAdminCompanyVO after(int faqNo);



}
