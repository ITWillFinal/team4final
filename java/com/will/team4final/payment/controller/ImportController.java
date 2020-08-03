package com.will.team4final.payment.controller;

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

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.payment.controller.ImportController;
import com.will.team4final.payment.model.PaymentVO;

@Controller
public class ImportController {
		private static final Logger logger = LoggerFactory.getLogger(ImportController.class);
		
		@Autowired private ComMemberService comMemberService;
		@Autowired private ComRecruitService comRecruitService;
		
		@RequestMapping("/import/import.do")
		public void import_get() {
			
			
		}
		
		@RequestMapping(value = "/companyWritePeriod/payment.do", method = RequestMethod.POST)
		public String companyWritePeriod_post(@ModelAttribute ComRecruitVO comRecruitVo , @ModelAttribute PaymentVO paymentVo,
				Model model) {
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
			
			//기업 채용 정보에 입력된 정보 가져오기
			String recruitmentCode = comRecruitVo.getRecruitmentCode();
			comRecruitVo = comRecruitService.selectOneCom(recruitmentCode);
			
			
			model.addAttribute("comRecruitVo", comRecruitVo);
			model.addAttribute("paymentVo", paymentVo);
			return "import/import";
		}
		
		
		@RequestMapping("/import/payment.do")
		public String payment_post(HttpSession session,Model model,@ModelAttribute PaymentVO paymentVo,@RequestParam String max) {
			 logger.info("max={}, paymentVo={}",max, paymentVo);
			 
			 
			return "index";
		}
	}
