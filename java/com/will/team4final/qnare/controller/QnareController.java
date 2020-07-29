package com.will.team4final.qnare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.qnare.model.QnareDAO;
import com.will.team4final.qnare.model.QnareService;
import com.will.team4final.qnare.model.QnareVO;

@Controller
@RequestMapping("/gogak/qnare")
public class QnareController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(QnareController.class);
	
	@Autowired QnareService qnareService;
	
	@RequestMapping("/replyList.do")
	public String selectRe(@RequestParam (defaultValue = "0") int qnaNo,
			Model model) {
		logger.info("{}번 1:1 문의게시판 답변", qnaNo);
		
		QnareVO revo =  qnareService.selectRe(qnaNo);
		logger.info("{}번 1:1 문의게시판 revo={}",qnaNo, revo );
		
		model.addAttribute("revo", revo);
		
		return "/gogak/qnare/replyList";
	}
	
	@RequestMapping("/replyWrite.do")
	public String replyWrite(@ModelAttribute QnareVO vo,
			@RequestParam (defaultValue = "0")int no,
			Model model) {
		vo.setQnaNo(no);
		logger.info("답변 등록 파라미터 vo = {}", vo);
		
		String msg = "답변 등록 실패!", url = "/gogak/qnare/replyWrite.do";
		int cnt = qnareService.replyWrite(vo);
		logger.info("답변 등록 결과 cnt = {}", cnt);
		if(cnt>0) {
			msg = "답변 등록 성공!";
			url = "/gogak/qna/qnaDetail.do?no="+vo.getQnaNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("/replyDelete.do")
	public String replyDel(@RequestParam(defaultValue = "0") int no,
			Model model) {
		logger.info("답글 삭제 파라미터 no={}", no);
		
		int cnt = qnareService.replyDel(no);
		String msg = "답글 삭제 실패",url = "/gogak/qna/qnaDetail.do?no="+no;
		if(cnt>0) {
			msg = "답글 삭제 성공!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";

	}


}
