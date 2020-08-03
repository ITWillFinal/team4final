package com.will.team4final.payment.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.payment.model.PaymentService;
import com.will.team4final.payment.model.PaymentVO;

@Controller
public class ImportController {
		private static final Logger logger = LoggerFactory.getLogger(ImportController.class);
		
		@Autowired private ComRecruitService comRecruitService;
		@Autowired private PaymentService paymentService;
		@Autowired private ComMemberService cMemberSerice;
		
		@RequestMapping(value = "/companyWritePeriod/payment.do", method = RequestMethod.POST)
		public String companyWritePeriod_post(@ModelAttribute ComRecruitVO comRecruitVo , @ModelAttribute PaymentVO paymentVo,
				Model model, HttpSession session) {
			logger.info("기업회원 채용공고 기간 저장, 파라미터 comRecruitVo={}", comRecruitVo);
			logger.info("기업회원 채용공고 기간 저장, 파라미터 paymentVo={}",paymentVo);
			
			//이력서 종류 채용 정보에 입력
			int cnt = comRecruitService.updateResumeType(comRecruitVo);
			if(cnt < 1 ) {
				String msg="이력서 종류 선택 실패했습니다", url="/companypage/companyWritePeriod.do";
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "common/message";
			}
			logger.info("기업회원 채용공고 기간 저장 이력서 입력 성공");
			
			String cUserid = (String)session.getAttribute("userid");
			CompanyMemberVO comMemberVo=cMemberSerice.selectCMemberInfoByUserid(cUserid);
			String cMemberCode = comMemberVo.getcMemberCode();
			
			//기업 채용 정보에 입력된 정보 가져오기
			String recruitmentCode = comRecruitVo.getRecruitmentCode();
			comRecruitVo = comRecruitService.selectOneCom(recruitmentCode);
			logger.info("기업회원 채용공고 comRecruitVo={}", comRecruitVo);
			
			
			model.addAttribute("cMemberCode", cMemberCode);
			model.addAttribute("paymentVo", paymentVo);
			model.addAttribute("comRecruitVo", comRecruitVo);
			return "import/import";
		}
		
		
		@RequestMapping("/import/payment.do")
		@ResponseBody
		public int payment_post(HttpSession session,Model model,@ModelAttribute PaymentVO paymentVo) {
			 logger.info("결제 창 db 저장 화면, paymentVo={}", paymentVo);
			 
			 int cnt = paymentService.insertPayment(paymentVo);
			return cnt;
		}
	}
