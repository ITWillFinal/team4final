package com.will.team4final.payment.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.common.DateSearchVO;
import com.will.team4final.common.PaginationInfo;
import com.will.team4final.common.SearchVO;
import com.will.team4final.common.Utility;
import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.payment.model.PaymentService;
import com.will.team4final.payment.model.PaymentVO;
import com.will.team4final.termsOfService.model.TermsOfServiceService;
import com.will.team4final.termsOfService.model.TermsOfServiceVO;

@Controller
public class ImportController {
	private static final Logger logger = LoggerFactory.getLogger(ImportController.class);
	
	@Autowired private ComRecruitService comRecruitService;
	@Autowired private PaymentService paymentService;
	@Autowired private ComMemberService cMemberSerice;
	@Autowired private TermsOfServiceService tosService;
	
	@RequestMapping(value = "/companyWritePeriod/payment.do", method = RequestMethod.POST)
	public String companyWritePeriod_post(@ModelAttribute ComRecruitVO comRecruitVo , @ModelAttribute PaymentVO paymentVo,
			Model model, HttpSession session,
			@RequestParam String endDay) {
		logger.info("기업회원 채용공고 기간 저장, 파라미터 comRecruitVo={}", comRecruitVo);
		logger.info("기업회원 채용공고 기간 저장, 파라미터 paymentVo={}",paymentVo);
		logger.info("기업회원 채용공고 기간 저장, 파라미터 endDay={}",endDay);
		
		//이력서 종류 채용 정보에 입력
		int cnt = comRecruitService.updateResumeType(comRecruitVo);
		if(cnt < 1 ) {
			String msg="이력서 종류 선택 실패했습니다", url="/companypage/companyWritePeriod.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		logger.info("기업회원 채용공고 기간 저장 이력서 입력 성공");
		
		//이력서 종류 값 구하기
		int resumeType = comRecruitVo.getResumeType();
		logger.info("resumeType={}",resumeType);
		
		String cUserid = (String)session.getAttribute("userid");
		CompanyMemberVO comMemberVo=cMemberSerice.selectCMemberInfoByUserid(cUserid);
		String cMemberCode = comMemberVo.getcMemberCode();
		
		//기업 채용 정보에 입력된 정보 가져오기
		String recruitmentCode = comRecruitVo.getRecruitmentCode();
		logger.info("기업회원 채용공고 recruitmentCode={}", recruitmentCode);
		
		
		model.addAttribute("endDay", endDay);
		model.addAttribute("cMemberCode", cMemberCode);
		model.addAttribute("paymentVo", paymentVo);
		model.addAttribute("recruitmentCode", recruitmentCode);
		model.addAttribute("resumeType", resumeType);
		return "import/import";
	}
	
	
	@RequestMapping("/import/payment.do")
	@ResponseBody
	public int payment_post(HttpSession session,Model model,@RequestParam String productName, @RequestParam String cMemberCode, @RequestParam int price, @RequestParam String recruitmentCode, @RequestParam String endDay) {
		 logger.info("결제 창 db 저장 화면, {}, {}", cMemberCode, price);
		 logger.info("결제 창 db 저장 화면, recruitmentCode={}", recruitmentCode);
		 
		 //결제 db에 저장
		 PaymentVO paymentVo = new PaymentVO();
		 paymentVo.setcMemberCode(cMemberCode);
		 paymentVo.setPrice(price);
		 paymentVo.setProductName(productName);
		 paymentVo.setRecruitmentCode(recruitmentCode);
		 int cnt = paymentService.insertPayment(paymentVo);
		 logger.info("결제 창 cnt={}", cnt);
		 
		 //서비스 기간 db에 저장
		 
		 TermsOfServiceVO tosVo = new TermsOfServiceVO();
		 tosVo.setEndDate(endDay);
		 tosVo.setRecruitmentCode(recruitmentCode);
		 int result = tosService.insertTOS(tosVo);
		 logger.info("결제 창 result={}", result);
		 
		return result;
	}
	
	@RequestMapping("/payment/paymentList.do")
	public void paymentList(@ModelAttribute DateSearchVO datesearchVo, 
			HttpSession session,Model model) {
		String userid = (String) session.getAttribute("userid");
		
		logger.info("결제목록 searchvo={}", datesearchVo);
		logger.info("결제목록 파라미터 dateSearchVo={}", datesearchVo);
		
		//페이징
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(datesearchVo.getCurrentPage());
		
		//searchVO에 세팅
		datesearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		datesearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		logger.info("레코드 개수 = {}", datesearchVo.getRecordCountPerPage());
		
		//datesearch 시작, 종료일시
		datesearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		datesearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		
		String startDay = datesearchVo.getStartDay();
		if(startDay == null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			datesearchVo.setEndDay(str);
			
			//초기접속, 시작날짜 설정
			String str2 = "2020-01-01";
			datesearchVo.setStartDay(str2);
		}
		
		
		//map => orderSheet_get 참고
		List<Map<String, Object>> list = paymentService.selectPaymentAdmin(datesearchVo);
		logger.info("결제내역 결과, list.size()={}", list.size());
		  
		int totalRecord = paymentService.selectTotalRecordAdmin(datesearchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("결제내역 개수 조회 결과, totalRecord = {}", totalRecord);
		  
		  
		  
		//기간내 판매수익 
		String totalPrice = paymentService.selectTotalPriceAdmin(datesearchVo);
		if(totalPrice == null || totalPrice.isEmpty()) {
			totalPrice="0";
		}
		 
		
		//model 담기
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("userid",userid);
		model.addAttribute("totalPrice",totalPrice);
		
	}
	
	
	///////////////////////////////////////////////////////////////////////////////////
	/////////↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓paymentListC↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓/////////////
	///////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/companypage/paymentListC.do")
	public void paymentListC(@ModelAttribute SearchVO searchvo, 
			@ModelAttribute DateSearchVO datesearchVo, 
			HttpSession session,Model model) {
		String customerId = (String) session.getAttribute("userid");
		datesearchVo.setCustomerId(customerId);
		
		logger.info("결제목록 searchvo={}", searchvo);
		logger.info("결제목록 파라미터 dateSearchVo={}", datesearchVo);
		logger.info("회원 ID customerId={}", customerId);
		
		//페이징
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchvo.getCurrentPage());
		
		//searchVO에 세팅
		searchvo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchvo.setRecordCountPerPage(Utility.RECORD_COUNT);
		logger.info("레코드 개수 = {}", searchvo.getRecordCountPerPage());
		
		//datesearch 시작, 종료일시
		datesearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		datesearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		String startDay = datesearchVo.getStartDay();
		if(startDay == null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			datesearchVo.setEndDay(str);

			//초기접속, 시작날짜 설정
			String str2 = "2020-01-01";
			datesearchVo.setStartDay(str2);
		}
		
		//map => orderSheet_get 참고
		List<Map<String, Object>> list = paymentService.selectPaymentC(datesearchVo);
		logger.info("결제내역 결과, list.size()={}", list.size());
		
		int totalRecord = paymentService.selectTotalRecordC(datesearchVo);
		logger.info("결제내역 개수 조회 결과, totalRecord = {}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		//model 담기
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	@RequestMapping(value = "/payment/extendPeriod.do", method = RequestMethod.GET)
	public void extendPeriod(HttpSession session, Model model, @RequestParam(required = false) String recruitmentCode) {
		TermsOfServiceVO tosVo = tosService.selectByrecruitmentCode(recruitmentCode);
		ComRecruitVO comRecruitVO = comRecruitService.selectOneByRecruitmentCode(recruitmentCode);
		logger.info("서비스 기간 연장 창, tosVo={}, comRecruitVO={} ", tosVo,comRecruitVO );
		PaymentVO paymentVo = paymentService.selectByrecruitmentCode(recruitmentCode);
		logger.info("서비스 기간 연장 창, paymentVo={}", paymentVo);
		
		
		model.addAttribute("tosVo", tosVo);
		model.addAttribute("comRecruitVO", comRecruitVO);
		model.addAttribute("paymentVo", paymentVo);
		
	}
	
	
	@RequestMapping(value = "/payment/extendPeriod.do", method = RequestMethod.POST)
	public String extendPeriod(HttpSession session, Model model,
			@ModelAttribute TermsOfServiceVO tosVo, @ModelAttribute PaymentVO paymentVo,
			@RequestParam(defaultValue = "0")int extraPrice) {
		logger.info("서비스 연장 페이지, 파라미터 tosVo={} ",tosVo);
		logger.info("서비스 연장 페이지, 파라미터 paymentVo={}",paymentVo );
		logger.info("서비스 연장 페이지, 파라미터 extraPrice={}",extraPrice );
		
		model.addAttribute("tosVo", tosVo);
		model.addAttribute("paymentVo", paymentVo);
		model.addAttribute("extraPrice", extraPrice);
		return "import/extendPeriod";
	}
	
	@RequestMapping("/import/extendPeriod.do")
	@ResponseBody
	public int extendPeriodPayment(@RequestParam String endDate, @RequestParam int price,
			@RequestParam String recruitmentCode,
			@RequestParam String extraPrice,
			Model model) {
		logger.info("서비스 연장 결제창, 파라미터 endDate={}, price={} ", endDate, price);
		logger.info("서비스 연장 결제창, 파라미터 recruitmentCode={},extraPrice={} ", recruitmentCode,extraPrice);
		//tos 변경 
		TermsOfServiceVO tosVo = new TermsOfServiceVO();
		tosVo.setEndDate(endDate);
		tosVo.setRecruitmentCode(recruitmentCode);
		int cnt = tosService.updateEndDate(tosVo);
		logger.info("tos 업데이트 결과, cnt={}", cnt);
		
		//payment price 변경
		PaymentVO paymentVo = new PaymentVO();
		paymentVo.setRecruitmentCode(recruitmentCode);
		paymentVo.setPrice(price);
		cnt = paymentService.updatePrice(paymentVo);
		logger.info("payment 업데이트 결과, cnt={}", cnt);
		
		return cnt;
	}
		
}









