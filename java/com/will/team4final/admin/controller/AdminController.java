package com.will.team4final.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.google.gson.annotations.SerializedName;
import com.will.team4final.admin.model.AdminService;
import com.will.team4final.common.PaginationInfo;
import com.will.team4final.common.SearchVO;
import com.will.team4final.common.Utility;
import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.notice.model.NoticeListVO;
import com.will.team4final.notice.model.NoticeService;
import com.will.team4final.notice.model.NoticeVO;
import com.will.team4final.payment.model.PaymentService;
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
	private ComMemberService comMemberService;
	@Autowired 
	private AdminService adminService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private PaymentService paymentServ;
	
	@RequestMapping("/adminMain.do")
	public void adminMain(Model model) {
		logger.info("관리자 메인 홈!");
		SearchVO searchVo = new SearchVO();
		
		//회원 가입된 인원 수 구하기
		int totalRecordOfAdmin =adminService.selectTotalRecordOfAdmin(searchVo);
		
		//new user 구하기
		int todayMember = adminService.selectTodayRegisterMember();
		int todayCMember = adminService.selectTodayRegisterCMember();
		int totalToday = todayMember + todayCMember;
		String todayPay = paymentServ.selectTodayPayment();
		
		//답변 달지 않은 1:1 문의 게시판 게시글 수
		int cnt = qnaService.noRe();
	    model.addAttribute("cnt", cnt);
		
	    //전월대비 당월 매출 증감율
	    Date date = new Date();
	    logger.info("date={}", date);
	    String today = date.toString();
	    logger.info("today={}", today);
	    SimpleDateFormat sdf = new SimpleDateFormat("MM");
	    String month = sdf.format(date);
	    logger.info("month={}", month);
	    
	    double ind = 0;
	    String result = "";
	    
	    String beforePay = paymentServ.selectBefore(month);
	    logger.info("전월 매출={}",beforePay);
	    String thisPay = paymentServ.selectThis(month);
	    logger.info("당월 매출={}",thisPay);
	    if(beforePay == null ||beforePay.isEmpty() || thisPay == null ||thisPay.isEmpty()) {
	    	result = "전월 혹은 당월 결제 내역이 없습니다.";
	    }else if(thisPay != null && !thisPay.isEmpty() && beforePay != null && !beforePay.isEmpty() ) {
	    	int tp = Integer.parseInt(thisPay);
	    	int bp = Integer.parseInt(beforePay);
	    	ind = Math.round((((double)(tp-bp))/bp)*10000)/100.0;
	    	
	    	logger.info("(tp-bp)/100={}",((double)(tp-bp))/bp);
	    	logger.info("(tp-bp)/100={}",(((double)(tp-bp))/bp)*100);
	    	logger.info("반올림 (tp-bp)/100={}",ind);
	    	logger.info("증감율 = {}", ind);
			result = Double.toString(ind);
		}
	    
	    logger.info("전월대비 당월 증감율={}", result);
	    
		model.addAttribute("totalRecordOfAdmin", totalRecordOfAdmin);
		model.addAttribute("totalToday", totalToday);
		model.addAttribute("todayPay", todayPay);
		model.addAttribute("result", result);
		
	}

	@RequestMapping("/adminNotice.do")
	public String adminNotice(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("공지사항 관리 페이지 searchVo={}, searchKeyword={}", searchVo);
		
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
	public String adminMemberManagement(@ModelAttribute SearchVO searchVo, Model model, @RequestParam(required = false) String adminStatus) {
		logger.info("관리자 회원 관리 페이지, adminStatus={}, 파라미터 searchVo={}", adminStatus, searchVo);
		if(adminStatus==null || adminStatus.isEmpty()) {
			adminStatus="A";
		}
		if(adminStatus.equals("U")) {
			//[1] PaginationInfo 생성
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCKSIZE);
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//[2] SearchVo 에 값 셋팅
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
			logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());

			List<MemberVO> memberList = memberService.showAllMemberUser(searchVo);
			
			//totalRecord
			int totalRecord = memberService.selectTotalRecordOfMember(searchVo);
			logger.info("member, 전체 레코드 개수 totalRecord = {}",totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			model.addAttribute("memberList", memberList);
			model.addAttribute("pagingInfo", pagingInfo);
			
			return "admin/adminMemberManagement";
		}else if(adminStatus.equals("C")) {
			//[1] PaginationInfo 생성
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCKSIZE);
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//[2] SearchVo 에 값 셋팅
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
			logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());
			
			List<CompanyMemberVO> comList = comMemberService.showAllCMember(searchVo);
			logger.info("회사 회원 조회 결과, comList={}", comList);
			int totalRecord = comMemberService.selectTotalRecordOfCMember(searchVo);
			logger.info("comList, 전체 레코드 개수 totalRecord = {}",totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			model.addAttribute("comList", comList);
			model.addAttribute("pagingInfo", pagingInfo);
			
			return "admin/adminMemberManagement";
		}else if(adminStatus.equals("A")) {
			//[1] PaginationInfo 생성
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCKSIZE);
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//[2] SearchVo 에 값 셋팅
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
			logger.info("레코드 개수={}", searchVo.getRecordCountPerPage());
			List<MemberVO> adminList = adminService.adminShowAllMember(searchVo);
			int totalRecord = adminService.selectTotalRecordOfAdmin(searchVo);
			logger.info("adminList, 전체 레코드 개수 totalRecord = {}",totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			model.addAttribute("adminList", adminList);
			model.addAttribute("pagingInfo", pagingInfo);
			
			return "admin/adminMemberManagement";
		}
		
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

	
	
	@RequestMapping("/deleteComUser.do")
	public String deleteComUser(@RequestParam(defaultValue = "0") String cMemberCode, Model model) {
		logger.info("관리자 페이지에서 회사 회원 삭제, 파라미터 cMemberCode={}", cMemberCode );
		
		String msg="삭제 실패 했습니다", url="/admin/adminMemberManagement.do?adminStatus=C";
		int cnt = comMemberService.deleteCMember(cMemberCode);
		logger.info("회사 회원 삭제 결과, cnt={}", cnt);
		if(cnt>0) {
			msg="회원 삭제 성공했습니다";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
	@RequestMapping(value = "/adminMemberUpdate.do", method = RequestMethod.GET)
	public String adminUpdateMemberUpdate(@RequestParam(required = false) String userNo,
			@RequestParam(required = false) String userStatus,
			@RequestParam(required = false) String update,
			Model model) {
		logger.info("관리자에서 회원정보 수정 화면, 파라미터 userNo={}, userStatus={}", userNo, userStatus );
		logger.info("관리자에서 회원정보 수정 화면, 파라미터 update={}", update);
		if(userNo==null || userNo.isEmpty()) {
			userNo="";
		}
		if(userStatus==null || userStatus.isEmpty()) {
			userStatus="";
		}
		if(update==null || update.isEmpty()){
			update="";
		}
		
		if(userStatus.equals("U")) {
			MemberVO memVo=memberService.selectByUerNo(userNo);
			logger.info("개인 회원 유저 넘버로 조회 결과, memVo={}", memVo);
			model.addAttribute("memVo", memVo);
			return "admin/adminMemberUpdate";
		}else if(userStatus.equals("C")) {
			CompanyMemberVO comVo = comMemberService.selectCMemberByUserCode(userNo);
			logger.info("회사 회원 유저 넘버로 조회 결과, comVo={}", comVo);
			model.addAttribute("comVo", comVo);
			return "admin/adminCMemberUpdate";
		}

		return "admin/adminMemberUpdate";
	}
	
	@RequestMapping(value = "/adminMemberUpdate.do", method = RequestMethod.POST)
	public String adminMemberUpdate(@ModelAttribute MemberVO memberVo, Model model) {
		logger.info("회원 수정 값, 파라미터 memberVo={}", memberVo);
		
		String msg="회원 정보 수정 실패 했습니다", url="/admin/adminMemberUpdate.do";
		int cnt = memberService.updateMember(memberVo);
		logger.info("회원정보 수정 결과, cnt={}", cnt);
		if(cnt>0) {
			msg="회원 정보 수정 성공했습니다.";
			url="/admin/adminMemberUpdate.do?update=true";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
							
	@RequestMapping(value = "/adminCMemberUpdate.do", method = RequestMethod.GET)
	public String adminCMemberUpdate(@RequestParam(required = false) String update,Model model) {
		if(update==null || update.isEmpty()){
			update="";
		}
		return "admin/adminCMemberUpdate";
	}
	
	@RequestMapping(value = "/adminCMemberUpdate.do", method = RequestMethod.POST)
	public String adminCMemberUpdate_post(@ModelAttribute CompanyMemberVO companyMemberVo, Model model) {
		logger.info("회사 회원 정보 수정 과정, 파라미터 companyMemberVo={}", companyMemberVo);
		
		String msg="회사 회원 정보 수정 실패 했습니다", url="/admin/adminCMemberUpdate.do?update=true";
		int cnt = comMemberService.updateCMember(companyMemberVo);
		logger.info("회사 회원 정보 수정 결과, cnt={}", cnt);
		if(cnt>0) {
			msg="회원 정보 수정 성공했습니다.";
		}
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/adminPayment.do")
	public void adminPayment() {
		logger.info("매출현황 조회");
	}
	
	@RequestMapping(value="/insertImage.do", method=RequestMethod.POST)
	@ResponseBody
    public String insertImage(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile) throws Exception {
	    JsonObject json = new JsonObject();
	    PrintWriter printWriter = null;
	    OutputStream out = null;
	    MultipartFile file = multiFile.getFile("upload");
	    if(file != null) {
	    	if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
	    		if(file.getContentType().toLowerCase().startsWith("image/")) {
	    			try {
	    				String fileName = file.getName();
	    				byte[] bytes = file.getBytes();
	    				String uploadPath = request.getServletContext().getRealPath("/img");
	    				File uploadFile = new File(uploadPath);
	    				if(!uploadFile.exists()) {
	    					uploadFile.mkdir();
	    				}
	    				fileName = UUID.randomUUID().toString();
	    				uploadPath = uploadPath + "/" + fileName;
	    				out = new FileOutputStream(new File(uploadPath));
	    				out.write(bytes);
	    				
	    				printWriter = response.getWriter();
	    				response.setContentType("text/html");
	    				String fileUrl = request.getContextPath() + "/img/" + fileName;
	    				
	    				//json데이터로 등록
	    				//{"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
	    				//이런 형식
	    				
	    				json.addProperty("uploaded", 1);
	    				json.addProperty("fileName", fileName);
	    				json.addProperty("url", fileUrl);
	    				
	    				printWriter.println(json);
	    			}catch (IOException e) {
	    				e.printStackTrace();
					}finally {
						if(out != null) {
							out.close();
						}
						if(printWriter != null) printWriter.close();
					}
	    		}
	    	}
	    }
	    return null;
    }

}
