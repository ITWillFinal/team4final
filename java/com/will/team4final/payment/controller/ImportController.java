package com.will.team4final.payment.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.payment.controller.ImportController;
import com.will.team4final.payment.model.PaymentVO;

@Controller
public class ImportController {
		private static final Logger logger = LoggerFactory.getLogger(ImportController.class);
		
		@Autowired private ComMemberService comMemberService;
		
		@RequestMapping("/import/import.do")
		public String showImport(HttpSession session, Model model) {
			logger.info("임포트 페이지 화면 보여지기, 파라미터 ");
			/*
			 * String cUserid = (String)session.getAttribute("userid");
			 * 
			 * CompanyMemberVO comMemberVo =
			 * comMemberService.selectCMemberInfoByUserid(cUserid);
			 * logger.info("임포트 회사 회원 정보 확인, comMemberVo={}", comMemberVo);
			 * 
			 * model.addAttribute("comMemberVo", comMemberVo);
			 */
			return "import/import";
		}
		
		@RequestMapping("/import/payment.do")
		public String payment_post(@RequestParam(defaultValue = "0") int price, HttpSession session,Model model) {
			logger.info("결제 값 가져오기, 파라미터 price={}", price);
			String cUserid = (String)session.getAttribute("userid");
			
			CompanyMemberVO comMemberVo=comMemberService.selectCMemberInfoByUserid(cUserid);
			logger.info("결체 회원 정보, comMemberVo={}", comMemberVo);
			String cMemberCode = comMemberVo.getcMemberCode();
			logger.info("회원 comMemberVo={}", comMemberVo);
			 
			 
			 
			return "";
		}
	}
