package com.will.team4final.admin.controller;

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

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.PaginationInfo;
import com.will.team4final.common.SearchVO;
import com.will.team4final.common.Utility;
import com.will.team4final.gogak.model.FaqVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.notice.model.NoticeListVO;
import com.will.team4final.notice.model.NoticeService;
import com.will.team4final.notice.model.NoticeVO;
import com.will.team4final.qna.model.QnaService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private NoticeService noticeServ;
	@Autowired
	private MemberService memberService;
	@Autowired
	private QnaService qnaService;

	@RequestMapping("/adminMain.do")
	public void adminMain(Model model) {
		logger.info("관리자 메인 홈!");
		
		int cnt = qnaService.noRe();
		model.addAttribute("cnt", cnt);
		
	}

	@RequestMapping("/adminNotice.do")
	public String adminNotice(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("공지사항 관리 페이지");

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());

		List<NoticeVO> list = noticeServ.selectAllNotice(searchVo);
		logger.info("공지사항 목록 개수 = {}", list.size());

		int totalRecord = noticeServ.totalNotice(searchVo);
		logger.info("totalRecord 개수 = {}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);

		return "admin/adminNotice";
	}

	@RequestMapping(value = "/adminAddNotice.do", method = RequestMethod.GET)
	public String adminAddNotice_get() {
		logger.info("공지사항 등록 페이지");

		return "admin/adminAddNotice";
	}

	@RequestMapping(value = "/adminAddNotice.do", method = RequestMethod.POST)
	public String adminAddNotice_post(@ModelAttribute NoticeVO vo, Model model) {
		logger.info("공지사항 등록 처리 페이지, 파라미터 vo = {}", vo);
		vo.setFilename("");
		vo.setOriginfilename("");
		int cnt = noticeServ.insertNotice(vo);

		String url = "/admin/adminAddNotice.do", msg = "등록오류입니다.";
		if (cnt > 0) {
			url = "/admin/adminNotice.do";
			msg = "등록 완료되었습니다.";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";
	}

	@RequestMapping("/adminNoticeDetail.do")
	public String adminNoticeDetail(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		logger.info("공지사항 디테일, 파라미터 noticeNo = {}", noticeNo);

		NoticeVO vo = noticeServ.selectNoticeByNo(noticeNo);
		logger.info("공지사항 vo = {}", vo);

		model.addAttribute("vo", vo);

		return "admin/adminNoticeDetail";
	}

	/*
	 * @RequestMapping("/adminNoticeDelete.do") public String
	 * adminNoticeDelete(@RequestParam(defaultValue = "0")int noticeNo, Model model)
	 * { logger.info("공지사항 삭제, 파라미터 noticeNo = {}", noticeNo);
	 * 
	 * int cnt = noticeServ.deleteNotice(noticeNo);
	 * 
	 * String url = "/admin/adminNotice.do", msg = "삭제오류입니다."; if(cnt > 0) { url =
	 * "/admin/adminNotice.do"; msg = "삭제 완료되었습니다."; }
	 * 
	 * model.addAttribute("url", url); model.addAttribute("msg", msg);
	 * 
	 * return "common/message"; }
	 */

	@RequestMapping("/adminNoticeDelete.do")
	public String multiDeleteNotice(@ModelAttribute NoticeListVO listNotice, Model model) {
		logger.info("공지사항 다중 삭제, 파라미터 listNotice = {}", listNotice);

		List<NoticeVO> list = listNotice.getListNotice();

		int cnt = noticeServ.deleteMultiNotice(list);
		logger.info("선택한 게시글 삭제 결과 cnt = {}", cnt);

		String msg = "", url = "/admin/adminNotice.do";
		if (cnt > 0) {
			msg = "선택한 공지사항을 삭제했습니다.";

			for (int i = 0; i < list.size(); i++) {
				NoticeVO vo = list.get(i);
				logger.info("i={}", i);
				logger.info("noticeNO={}", vo.getNoticeNo());
			} // for
		} else {
			msg = "선택한 공지사항 삭제 실패! 에러 발생!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/adminMemberManagement.do")
	public String adminMemberManagement(@ModelAttribute DateSearchVO dateSearchVo, Model model) {
		logger.info("공지사항 등록 페이지");

		List<MemberVO> memberList = memberService.showAllMemberUser();

		model.addAttribute("memberList", memberList);

		return "admin/adminMemberManagement";
	}

	@RequestMapping(value = "/adminEditNotice.do", method = RequestMethod.GET)
	public String adminEditNotice_get(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		logger.info("공지사항 수정 파라미터 no = {}", noticeNo);

		NoticeVO vo = noticeServ.selectNoticeByNo(noticeNo);
		logger.info("가져온 값 vo = {}", vo);

		model.addAttribute("vo", vo);

		return "admin/adminEditNotice";
	}

	@RequestMapping(value = "/adminEditNotice.do", method = RequestMethod.POST)
	public String adminEditNotice_post(@ModelAttribute NoticeVO vo, Model model) {
		logger.info("공지사항 수정 파라미터 no = {}", vo);

		int cnt = noticeServ.updateNotice(vo);

		String url = "/admin/adminEditNotice.do?noticeNo=" + vo.getNoticeNo(), msg = "수정오류입니다.";
		if (cnt > 0) {
			url = "/admin/adminNoticeDetail.do?noticeNo="+vo.getNoticeNo();
			msg = "수정 완료되었습니다.";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";
	}
}
