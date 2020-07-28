package com.will.team4final.qna.controller;

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
import com.will.team4final.qna.model.QnaListVO;
import com.will.team4final.qna.model.QnaService;
import com.will.team4final.qna.model.QnaVO;

@Controller
@RequestMapping("/gogak/qna")
public class QnaController {
	
	private final static Logger logger
		= LoggerFactory.getLogger(QnaController.class);
	
	@Autowired private QnaService qnaService;
	
	@RequestMapping("/qnaList.do")
	public String qnaList(@ModelAttribute SearchVO searchVo,
				Model model) {
		//1
		logger.info("1:1 문의게시판 목록 searchVo={}", searchVo);
		
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
		List<QnaVO>list = qnaService.selectQna(searchVo);
		logger.info("1:1 문의게시판 목록 개수 list.size={}", list.size());
		
		int totalRecord = qnaService.selectTotalRecord(searchVo);
		logger.info("1:1 문의게시판, 전체 레코드 개수 totalRecord = {}",totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "gogak/qna/qnaList";
	}
	
	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.GET)
	public void faqWrite_get() {
		logger.info("1:1 문의게시판 글쓰기 보여주기");
	}

	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWrite_get(@ModelAttribute QnaVO vo,
			Model model) {
		logger.info("1:1 문의게시판 글쓰기 화면");
		
		int cnt = qnaService.WriteQna(vo);
		String msg = "1:1 문의게시판 등록 실패", url = "/gogak/qna/qnaWrite";
		if(cnt>0) {
			msg = "1:1 문의게시판 등록 성공";
			url = "/gogak/qna/qnaList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value = "/qnaDetail.do")
	public String selectByNo(@RequestParam(defaultValue = "0") int no,
			Model model) {
		logger.info("1:1 문의게시판 상세보기");
		
		QnaVO vo = qnaService.selectByNo(no);
		model.addAttribute("vo", vo);
		
		QnaVO afterVO =  qnaService.after(no);
		QnaVO beforeVO = qnaService.before(no);
		logger.info("aftervo={}", afterVO);
		logger.info("beforeVO={}", beforeVO);
		
		model.addAttribute("afterVO", afterVO);
		model.addAttribute("beforeVO", beforeVO);
		
		return "gogak/qna/qnaDetail";
		
	}
	
	@RequestMapping(value = "/qnaEdit.do", method = RequestMethod.GET)
	public String editQna_get(@RequestParam int no,
			Model model) {
		logger.info("1:1 문의게시판 수정 get 파라미터 vo = {}", no);
		
		QnaVO vo = qnaService.selectByNo(no);
		model.addAttribute("vo", vo);
		
		return "gogak/qna/qnaEdit";
		
	}
	
	@RequestMapping(value = "/qnaEdit.do", method = RequestMethod.POST)
	public String editQna_post(@ModelAttribute QnaVO vo,
			@RequestParam (defaultValue = "0")int no,
			Model model) {
		logger.info("1:1 문의게시판 수정 post 파라미터 vo = {}", vo);
		
		vo.setQnaNo(no);
		
		String msg = "1:1 문의게시판 수정 실패", url = "/gogak/qna/qnaEdit.do";
		int cnt = qnaService.editQna(vo);
		if(cnt>0) {
			msg = "1:1 문의게시판 수정 성공";
			url = "/gogak/qna/qnaDetail.do?no="+vo.getQnaNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaDelete.do")
	public String qnaEdit(@RequestParam (defaultValue = "0")int no,
			Model model) {
		String msg = "", url = "";
		int cnt = qnaService.deleteQna(no);
		if(cnt>0) {
			msg = "1:1 문의게시판 게시글이 삭제되었습니다.";
			url = "/gogak/qna/qnaList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/deleteMulti.do")
	public String delMulti(@ModelAttribute QnaListVO listvo,
			Model model) {
		logger.info("선택 게시글 삭제, 파라미터 qnavo={}", listvo);
		
		List<QnaVO>list = listvo.getQnaList();
		
		int cnt = qnaService.deleteMulti(list);
		logger.info("선택한 게시글 삭제 결과 cnt = {}", cnt);
		String msg = "", url = "/gogak/qna/qnaList.do";
		if(cnt>0) {
			msg = "선택한 게시글을 삭제했습니다.";
			
			for(int i=0 ; i<list.size() ; i++) {
				QnaVO vo = list.get(i);
				logger.info("i={}", i);
				logger.info("fnqNO={}", vo.getQnaNo());
			}//for
		}else {
			msg = "선택한 게시글 삭제 실패! 에러 발생!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
		
	
		
	}
	

}
