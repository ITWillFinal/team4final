package com.will.team4final.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.will.team4final.qnare.model.QnareService;
import com.will.team4final.qnare.model.QnareVO;

@Controller
@RequestMapping("/gogak")
public class QnaController {
	
	private final static Logger logger
		= LoggerFactory.getLogger(QnaController.class);
	
	@Autowired private QnaService qnaService;
	@Autowired private QnareService qnareService;
	
	@RequestMapping("/qna/qnaList.do")
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
	
	@RequestMapping(value = "/qna/qnaWrite.do", method = RequestMethod.GET)
	public void faqWrite_get(HttpSession session, Model model) {
		logger.info("1:1 문의게시판 글쓰기 보여주기");
		String userId = (String)session.getAttribute("userId");
		
		model.addAttribute("userId", userId);
	}

	@RequestMapping(value = "/qna/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWrite_get(@ModelAttribute QnaVO vo,
			Model model) {
		logger.info("1:1 문의게시판 글쓰기 화면");
		logger.info("vo={}", vo);
		
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
	
	@RequestMapping(value = "/qna/qnaDetail.do")
	public String selectByNo(@RequestParam(defaultValue = "0") int no,
			Model model) {
		logger.info("1:1 문의게시판 상세보기");

		//상세보기
		QnaVO vo = qnaService.selectByNo(no);
		logger.info("1:1 문의게시판 파라미터 = {}",vo);
		
		//이전글, 다음글
		QnaVO afterVO =  qnaService.after(no);
		QnaVO beforeVO = qnaService.before(no);
		logger.info("aftervo={}", afterVO);
		logger.info("beforeVO={}", beforeVO);
		
		//댓글 db처리
		int rst = qnareService.reCount(vo.getQnaNo());
		logger.info("{}번 글 답변 개수={}", vo.getQnaNo(), rst);
		
		//답변 보여주기
		QnareVO revo = qnareService.selectRe(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("afterVO", afterVO);
		model.addAttribute("beforeVO", beforeVO);
		model.addAttribute("rst", rst);
		model.addAttribute("revo", revo);
		
		
		return "gogak/qna/qnaDetail";
		
	}
	
	@RequestMapping(value = "/qna/qnaEdit.do", method = RequestMethod.GET)
	public String editQna_get(@RequestParam int no,
			Model model) {
		logger.info("1:1 문의게시판 수정 get 파라미터 vo = {}", no);
		
		QnaVO vo = qnaService.selectByNo(no);
		model.addAttribute("vo", vo);
		
		return "gogak/qna/qnaEdit";
		
	}
	
	@RequestMapping(value = "/qna/qnaEdit.do", method = RequestMethod.POST)
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
	
	@RequestMapping("/qna/qnaDelete.do")
	public String qnaEdit(@RequestParam (defaultValue = "0")int no,
			Model model) {
		
		int recnt = qnareService.replyDel(no);
		String msg = "", url = "";
		if(recnt<1) {
			msg = "1:1 문의게시판"+no+"번 게시글의 답변을 삭제하는데 오류가 있습니다.";
			url = "/gogak/qna/qnaList.do";
		}
		
		int cnt = qnaService.deleteQna(no);
		if(cnt>0) {
			msg = "1:1 문의게시판"+no+"번 게시글이 삭제되었습니다.";
			url = "/gogak/qna/qnaList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qna/deleteMulti.do")
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
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓qnaC↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓///
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping("/qnaC/qnaList.do")
	public String qnaCList(@ModelAttribute SearchVO searchVo,
				Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userid");
		logger.info("접속한 유저 아이디 userId = {}", userId);
		
		model.addAttribute("userId", userId);
		
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
		
		return "gogak/qnaC/qnaList";
	}
	
	@RequestMapping(value = "/qnaC/qnaWrite.do", method = RequestMethod.GET)
	public void qnaCWrite_get(HttpSession session, Model model) {
		logger.info("1:1 문의게시판 글쓰기 보여주기");
		String userid = (String)session.getAttribute("userid");
		
		model.addAttribute("userid", userid);
	}

	@RequestMapping(value = "/qnaC/qnaWrite.do", method = RequestMethod.POST)
	public String qnaCWrite_get(@ModelAttribute QnaVO vo,
			HttpSession session, Model model) {
		logger.info("1:1 문의게시판 글쓰기 화면");
		logger.info("vo={}", vo);

		String userId = (String)session.getAttribute("userid");
		vo.setUserId(userId);
		vo.setStatus("기업");
		
		int cnt = qnaService.WriteQna(vo);
		String msg = "1:1 문의게시판 등록 실패", url = "/gogak/qnaC/qnaWrite";
		if(cnt>0) {
			msg = "1:1 문의게시판 등록 성공";
			url = "/gogak/qnaC/qnaList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value = "/qnaC/qnaDetail.do")
	public String qnaCselectByNo(@RequestParam(defaultValue = "0") int no,
			Model model) {
		logger.info("1:1 문의게시판 상세보기");

		//상세보기
		QnaVO vo = qnaService.selectByNo(no);
		logger.info("1:1 문의게시판 파라미터 = {}",vo);
		
		//이전글, 다음글
		QnaVO afterVO =  qnaService.after(no);
		QnaVO beforeVO = qnaService.before(no);
		logger.info("aftervo={}", afterVO);
		logger.info("beforeVO={}", beforeVO);
		
		//댓글 db처리
		int rst = qnareService.reCount(vo.getQnaNo());
		logger.info("{}번 글 답변 개수={}", vo.getQnaNo(), rst);
		
		//답변 보여주기
		QnareVO revo = qnareService.selectRe(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("afterVO", afterVO);
		model.addAttribute("beforeVO", beforeVO);
		model.addAttribute("rst", rst);
		model.addAttribute("revo", revo);
		
		
		return "gogak/qnaC/qnaDetail";
		
	}
	
	@RequestMapping(value = "/qnaC/qnaEdit.do", method = RequestMethod.GET)
	public String editqnaC_get(@RequestParam int no,
			Model model) {
		logger.info("1:1 문의게시판 수정 get 파라미터 vo = {}", no);
		
		QnaVO vo = qnaService.selectByNo(no);
		model.addAttribute("vo", vo);
		
		
		return "gogak/qnaC/qnaEdit";
		
	}
	
	@RequestMapping(value = "/qnaC/qnaEdit.do", method = RequestMethod.POST)
	public String editqnaC_post(@ModelAttribute QnaVO vo,
			@RequestParam (defaultValue = "0")int qnaNo, HttpSession session,
			Model model) {
		logger.info("1:1 문의게시판 수정 post 파라미터 vo = {}", vo);
		
		String userId = (String)session.getAttribute("userid");
		
		vo.setUserId(userId);
		vo.setStatus("기업");
		vo.setQnaNo(qnaNo);
		logger.info("userId = {}", userId);
		logger.info("status = {}", vo.getStatus());
		logger.info("qnaNo = {}", vo.getQnaNo());
		
		String msg = "1:1 문의게시판 수정 실패", url = "/gogak/qnaC/qnaEdit.do";
		int cnt = qnaService.editQna(vo);
		if(cnt>0) {
			msg = "1:1 문의게시판 수정 성공";
			url = "/gogak/qnaC/qnaDetail.do?no="+vo.getQnaNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaC/qnaDelete.do")
	public String qnaCDel(@RequestParam (defaultValue = "0")int no,
			Model model) {
		
		int recnt = qnareService.replyDel(no);
		String msg = "", url = "";
		if(recnt<1) {
			msg = "1:1 문의게시판"+no+"번 게시글의 답변을 삭제하는데 오류가 있습니다.";
			url = "/gogak/qnaC/qnaList.do";
		}
		
		int cnt = qnaService.deleteQna(no);
		if(cnt>0) {
			msg = "1:1 문의게시판"+no+"번 게시글이 삭제되었습니다.";
			url = "/gogak/qnaC/qnaList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaC/deleteMulti.do")
	public String qnaCdelMulti(@ModelAttribute QnaListVO listvo,
			Model model) {
		logger.info("선택 게시글 삭제, 파라미터 qnavo={}", listvo);
		
		List<QnaVO>list = listvo.getQnaList();
		
		int cnt = qnaService.deleteMulti(list);
		logger.info("선택한 게시글 삭제 결과 cnt = {}", cnt);
		String msg = "", url = "/gogak/qnaC/qnaList.do";
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
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓qnaP↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓///
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping("/qnaP/qnaList.do")
	public String qnaPCList(@ModelAttribute SearchVO searchVo,
				Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userid");
		logger.info("접속한 유저 아이디 userId = {}", userId);
		
		model.addAttribute("userId", userId);
		
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
		
		return "gogak/qnaP/qnaList";
	}
	
	@RequestMapping(value = "/qnaP/qnaWrite.do", method = RequestMethod.GET)
	public void qnaPWrite_get(HttpSession session, Model model) {
		logger.info("1:1 문의게시판 글쓰기 보여주기");
		String userid = (String)session.getAttribute("userid");
		
		model.addAttribute("userid", userid);
	}

	@RequestMapping(value = "/qnaP/qnaWrite.do", method = RequestMethod.POST)
	public String qnaPWrite_get(@ModelAttribute QnaVO vo,
			HttpSession session, Model model) {
		logger.info("1:1 문의게시판 글쓰기 화면");
		logger.info("vo={}", vo);

		String userId = (String)session.getAttribute("userid");
		vo.setUserId(userId);
		vo.setStatus("개인");
		
		int cnt = qnaService.WriteQna(vo);
		String msg = "1:1 문의게시판 등록 실패", url = "/gogak/qnaP/qnaWrite";
		if(cnt>0) {
			msg = "1:1 문의게시판 등록 성공";
			url = "/gogak/qnaP/qnaList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value = "/qnaP/qnaDetail.do")
	public String qnaPselectByNo(@RequestParam(defaultValue = "0") int no,
			Model model) {
		logger.info("1:1 문의게시판 상세보기");

		//상세보기
		QnaVO vo = qnaService.selectByNo(no);
		logger.info("1:1 문의게시판 파라미터 = {}",vo);
		
		//이전글, 다음글
		QnaVO afterVO =  qnaService.after(no);
		QnaVO beforeVO = qnaService.before(no);
		logger.info("aftervo={}", afterVO);
		logger.info("beforeVO={}", beforeVO);
		
		//댓글 db처리
		int rst = qnareService.reCount(vo.getQnaNo());
		logger.info("{}번 글 답변 개수={}", vo.getQnaNo(), rst);
		
		//답변 보여주기
		QnareVO revo = qnareService.selectRe(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("afterVO", afterVO);
		model.addAttribute("beforeVO", beforeVO);
		model.addAttribute("rst", rst);
		model.addAttribute("revo", revo);
		
		
		return "gogak/qnaP/qnaDetail";
		
	}
	
	@RequestMapping(value = "/qnaP/qnaEdit.do", method = RequestMethod.GET)
	public String editqnaP_get(@RequestParam int no,
			Model model) {
		logger.info("1:1 문의게시판 수정 get 파라미터 vo = {}", no);
		
		QnaVO vo = qnaService.selectByNo(no);
		model.addAttribute("vo", vo);
		
		
		return "gogak/qnaP/qnaEdit";
		
	}
	
	@RequestMapping(value = "/qnaP/qnaEdit.do", method = RequestMethod.POST)
	public String editqnaP_post(@ModelAttribute QnaVO vo,
			@RequestParam (defaultValue = "0")int qnaNo, HttpSession session,
			Model model) {
		logger.info("1:1 문의게시판 수정 post 파라미터 vo = {}", vo);
		
		String userId = (String)session.getAttribute("userid");
		
		vo.setUserId(userId);
		vo.setStatus("개인");
		vo.setQnaNo(qnaNo);
		logger.info("userId = {}", userId);
		logger.info("status = {}", vo.getStatus());
		logger.info("qnaNo = {}", vo.getQnaNo());
		
		String msg = "1:1 문의게시판 수정 실패", url = "/gogak/qnaP/qnaEdit.do";
		int cnt = qnaService.editQna(vo);
		if(cnt>0) {
			msg = "1:1 문의게시판 수정 성공";
			url = "/gogak/qnaP/qnaDetail.do?no="+vo.getQnaNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaP/qnaDelete.do")
	public String qnaPDel(@RequestParam (defaultValue = "0")int no,
			Model model) {
		
		int recnt = qnareService.replyDel(no);
		String msg = "", url = "";
		if(recnt<1) {
			msg = "1:1 문의게시판"+no+"번 게시글의 답변을 삭제하는데 오류가 있습니다.";
			url = "/gogak/qnaP/qnaList.do";
		}
		
		int cnt = qnaService.deleteQna(no);
		if(cnt>0) {
			msg = "1:1 문의게시판"+no+"번 게시글이 삭제되었습니다.";
			url = "/gogak/qnaP/qnaList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaP/deleteMulti.do")
	public String qnaPdelMulti(@ModelAttribute QnaListVO listvo,
			Model model) {
		logger.info("선택 게시글 삭제, 파라미터 qnavo={}", listvo);
		
		List<QnaVO>list = listvo.getQnaList();
		
		int cnt = qnaService.deleteMulti(list);
		logger.info("선택한 게시글 삭제 결과 cnt = {}", cnt);
		String msg = "", url = "/gogak/qnaP/qnaList.do";
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
