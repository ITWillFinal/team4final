package com.will.team4final.gogak.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.common.PaginationInfo;
import com.will.team4final.common.SearchVO;
import com.will.team4final.common.Utility;
import com.will.team4final.gogak.model.FaqService;
import com.will.team4final.gogak.model.FaqVO;

@Controller
@RequestMapping("/gogak")
public class FaqController {

	private final static Logger logger
		= LoggerFactory.getLogger(FaqController.class);
	
	@Autowired private FaqService faqService;
	
	@RequestMapping("/faq.do")
	public String faq_get(Model model, SearchVO searchVo) {
		logger.info("고객센터 창 보여주기");
		
		List<FaqVO>list = faqService.selectFaq(searchVo);
		logger.info("고객센터 창 크기 list.size = {}", list.size());
		
		model.addAttribute("list", list);
		
		return "gogak/faq";
	}
	
	@RequestMapping(value = "/faqWrite.do", method = RequestMethod.GET)
	public void faqWrite_get() {
		logger.info("faq 등록화면 보여주기");
	}
	
	@RequestMapping(value = "/faqWrite.do", method = RequestMethod.POST)
	public String faqWrite_post(@ModelAttribute FaqVO vo,
			Model model) {
		logger.info("faq insert 화면");
		
		int cnt = faqService.WriteFaq(vo);
		String msg = "자주찾는 질문 등록 실패", url = "/gogak/faqWrite";
		if(cnt>0) {
			msg = "자주찾는 질문 등록 성공";
			url = "/gogak/faqList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	
	@RequestMapping("/faqList.do")
	public String faqList(@ModelAttribute SearchVO searchVo,
				Model model) {
		//1
		logger.info("자주찾는 질문 목록 searchVo={}", searchVo);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 에 값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());
		
		//2
		List<FaqVO>list = faqService.selectFaq(searchVo);
		logger.info("자주찾는 질문 목록 개수 list.size={}", list.size());
		
		int totalRecord = faqService.selectTotalRecord(searchVo);
		logger.info("자주찾는 질문 목록, 전체 레코드 개수 totalRecord = {}",totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "gogak/faqList";
	}
	
	@RequestMapping(value = "/faqDetail.do")
	public String selectByNo(@RequestParam(defaultValue = "0") int no,
			Model model) {
		logger.info("자주찾는 질문 상세보기");
		
		FaqVO vo = faqService.selectByNo(no);
		model.addAttribute("vo", vo);
		
		return "gogak/faqDetail";
		
	}
	
	@RequestMapping(value = "/faqEdit.do", method = RequestMethod.GET)
	public String editFaq_get(@RequestParam int no,
			Model model) {
		logger.info("자주찾는 질문 수정 get 파라미터 vo = {}", no);
		
		FaqVO vo = faqService.selectByNo(no);
		model.addAttribute("vo", vo);
		
		return "gogak/faqEdit";
		
	}
	
	@RequestMapping(value = "/faqEdit.do", method = RequestMethod.POST)
	public String editFaq_post(@ModelAttribute FaqVO vo,
			@RequestParam (defaultValue = "0")int no,
			Model model) {
		logger.info("자주 찾는 질문 수정 post 파라미터 vo = {}", vo);
		
		vo.setFnqNo(no);
		
		String msg = "자주 찾는 질문 수정 실패", url = "/gogak/faqEdit.do";
		int cnt = faqService.editFaq(vo);
		if(cnt>0) {
			msg = "자주 찾는 질문 수정 성공";
			url = "/gogak/faqDetail.do?no="+vo.getFnqNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/faqDelete.do")
	public String faqEdit(@RequestParam (defaultValue = "0")int no,
			Model model) {
		String msg = "", url = "";
		int cnt = faqService.deleteFaq(no);
		if(cnt>0) {
			msg = "자주 찾는 질문이 삭제되었습니다.";
			url = "/gogak/faqList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
}
