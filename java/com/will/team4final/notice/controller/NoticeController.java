package com.will.team4final.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.common.PaginationInfo;
import com.will.team4final.common.SearchVO;
import com.will.team4final.common.Utility;
import com.will.team4final.notice.model.NoticeService;
import com.will.team4final.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeServ;
	
	@RequestMapping("/memberNotice.do")
	public void noticeDetail(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("일반회원 공지사항  searchVo={}", searchVo);
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());

		List<NoticeVO> list = noticeServ.selectMemberNotice(searchVo);
		logger.info("공지사항 목록 개수 = {}", list.size());

		int totalRecord = noticeServ.totalMemberNotice(searchVo);
		logger.info("totalRecord 개수 = {}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);
		String keyword = searchVo.getSearchKeyword();
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/comNotice.do")
	public void comNotice(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("기업회원 공지사항  searchVo={}", searchVo);
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());
		
		List<NoticeVO> list = noticeServ.selectComNotice(searchVo);
		logger.info("공지사항 목록 개수 = {}", list.size());
		
		int totalRecord = noticeServ.totalComNotice(searchVo);
		logger.info("totalRecord 개수 = {}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		logger.info("공지사항 조회수 Up, 파라미터 noticeNo = {}", noticeNo);
		int cnt = noticeServ.updateNoticeReadcount(noticeNo);
		logger.info("조회수 Up결과 cnt = {}", cnt);
		return "redirect:/notice/noticeDetailGo.do?noticeNo="+noticeNo;
	}
	
	@RequestMapping("/noticeDetailGo.do")
	public String noticeDetailGo(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		logger.info("공지사항 디테일, 파라미터 noticeNo = {}", noticeNo);
		
		NoticeVO vo = noticeServ.selectNoticeByNo(noticeNo);
		logger.info("공지사항 vo = {}", vo);
		
		model.addAttribute("vo", vo);
		
		return "notice/noticeDetail";
	}
}
