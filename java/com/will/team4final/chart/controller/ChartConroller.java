package com.will.team4final.chart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.chart.model.ChartService;

@Controller
@RequestMapping("/chart")
public class ChartConroller {
	
	private Logger logger
		= LoggerFactory.getLogger(ChartConroller.class);
	
	@Autowired ChartService chartService;
	
	@RequestMapping("/AllChart.do")
	public void allChart(Model model) {
		logger.info("모든 차트 보여주기");
		logger.info("월별 매출 차트 보여주기");
		
		String s1 = chartService.sumByMonth("01");
		if (s1 == null || s1.length() == 0) {
			s1 = "0";
		}
		String s2 = chartService.sumByMonth("02");
		if (s2 == null || s2.length() == 0) {
			s2 = "0";
		}
		String s3 = chartService.sumByMonth("03");
		if (s3 == null || s3.length() == 0) {
			s3 = "0";
		}
		String s4 = chartService.sumByMonth("04");
		if (s4 == null || s4.length() == 0) {
			s4 = "0";
		}
		String s5 = chartService.sumByMonth("05");
		if (s5 == null || s5.length() == 0) {
			s5 = "0";
		}
		String s6 = chartService.sumByMonth("06");
		if (s6 == null || s6.length() == 0) {
			s6 = "0";
		}
		String s7 = chartService.sumByMonth("07");
		if (s7 == null || s7.length() == 0) {
			s7 = "0";
		}
		String s8 = chartService.sumByMonth("08");
		if (s8 == null || s8.length() == 0) {
			s8 = "0";
		}
		String s9 = chartService.sumByMonth("09");
		if (s9 == null || s9.length() == 0) {
			s9 = "0";
		}
		String s10 = chartService.sumByMonth("10");
		if (s10 == null || s10.length() == 0) {
			s10 = "0";
		}
		String s11 = chartService.sumByMonth("11");
		if (s11 == null || s11.length() == 0) {
			s11 = "0";
		}
		String s12 = chartService.sumByMonth("12");
		if (s12 == null || s12.length() == 0) {
			s12 = "0";
		}
		
		logger.info("1월 매출={}", s1);
		logger.info("2월 매출={}", s2);
		logger.info("3월 매출={}", s3);
		logger.info("4월 매출={}", s4);
		logger.info("5월 매출={}", s5);
		logger.info("6월 매출={}", s6);
		logger.info("7월 매출={}", s7);
		logger.info("8월 매출={}", s8);
		logger.info("9월 매출={}", s9);
		logger.info("10월 매출={}", s10);
		logger.info("11월 매출={}", s11);
		logger.info("12월 매출={}", s12);
		
		model.addAttribute("s1", s1);
		model.addAttribute("s2", s2);
		model.addAttribute("s3", s3);
		model.addAttribute("s4", s4);
		model.addAttribute("s5", s5);
		model.addAttribute("s6", s6);
		model.addAttribute("s7", s7);
		model.addAttribute("s8", s8);
		model.addAttribute("s9", s9);
		model.addAttribute("s10", s10);
		model.addAttribute("s11", s11);
		model.addAttribute("s12", s12);
		
		logger.info("월별 일반회원 증가율 보여주기");
		
		String msnum1 = chartService.countByMember("01");
		if (msnum1 == null || msnum1.length() == 0) {
			msnum1 = "0";
		}
		String msnum2 = chartService.countByMember("02");
		if (msnum2 == null || msnum2.length() == 0) {
			msnum2 = "0";
		}
		String msnum3 = chartService.countByMember("03");
		if (msnum3 == null || msnum3.length() == 0) {
			msnum3 = "0";
		}
		String msnum4 = chartService.countByMember("04");
		if (msnum4 == null || msnum4.length() == 0) {
			msnum4 = "0";
		}
		String msnum5 = chartService.countByMember("05");
		if (msnum5 == null || msnum5.length() == 0) {
			msnum5 = "0";
		}
		String msnum6 = chartService.countByMember("06");
		if (msnum6 == null || msnum6.length() == 0) {
			msnum6 = "0";
		}
		String msnum7 = chartService.countByMember("07");
		if (msnum7 == null || msnum7.length() == 0) {
			msnum7 = "0";
		}
		String msnum8 = chartService.countByMember("08");
		if (msnum8 == null || msnum8.length() == 0) {
			msnum8 = "0";
		}
		String msnum9 = chartService.countByMember("09");
		if (msnum9 == null || msnum9.length() == 0) {
			msnum9 = "0";
		}
		String msnum10 = chartService.countByMember("10");
		if (msnum10 == null || msnum10.length() == 0) {
			msnum10 = "0";
		}
		String msnum11 = chartService.countByMember("11");
		if (msnum11 == null || msnum11.length() == 0) {
			msnum11 = "0";
		}
		String msnum12 = chartService.countByMember("12");
		if (msnum12 == null || msnum12.length() == 0) {
			msnum12 = "0";
		}
		
		logger.info("1월 일반회원 가입자 수 ={}", msnum1);
		logger.info("2월 일반회원 가입자 수 ={}", msnum2);
		logger.info("3월 일반회원 가입자 수 ={}", msnum3);
		logger.info("4월 일반회원 가입자 수 ={}", msnum4);
		logger.info("5월 일반회원 가입자 수 ={}", msnum5);
		logger.info("6월 일반회원 가입자 수 ={}", msnum6);
		logger.info("7월 일반회원 가입자 수 ={}", msnum7);
		logger.info("8월 일반회원 가입자 수 ={}", msnum8);
		logger.info("9월 일반회원 가입자 수 ={}", msnum9);
		logger.info("10월 일반회원 가입자 수 ={}", msnum10);
		logger.info("11월 일반회원 가입자 수 ={}", msnum11);
		logger.info("12월 일반회원 가입자 수 ={}", msnum12);
		
		model.addAttribute("snum1", msnum1);
		model.addAttribute("snum2", msnum2);
		model.addAttribute("snum3", msnum3);
		model.addAttribute("snum4", msnum4);
		model.addAttribute("snum5", msnum5);
		model.addAttribute("snum6", msnum6);
		model.addAttribute("snum7", msnum7);
		model.addAttribute("snum8", msnum8);
		model.addAttribute("snum9", msnum9);
		model.addAttribute("snum10", msnum10);
		model.addAttribute("snum11", msnum11);
		model.addAttribute("snum12", msnum12);
		
		
		String snum1c = chartService.countByMemberC("01");
		if (snum1c == null || snum1c.length() == 0) {
			snum1c = "0";
		}
		String snum2c = chartService.countByMemberC("02");
		if (snum2c == null || snum2c.length() == 0) {
			snum2c = "0";
		}
		String snum3c = chartService.countByMemberC("03");
		if (snum3c == null || snum3c.length() == 0) {
			snum3c = "0";
		}
		String snum4c = chartService.countByMemberC("04");
		if (snum4c == null || snum4c.length() == 0) {
			snum4c = "0";
		}
		String snum5c = chartService.countByMemberC("05");
		if (snum5c == null || snum5c.length() == 0) {
			snum5c = "0";
		}
		String snum6c = chartService.countByMemberC("06");
		if (snum6c == null || snum6c.length() == 0) {
			snum6c = "0";
		}
		String snum7c = chartService.countByMemberC("07");
		if (snum7c == null || snum7c.length() == 0) {
			snum7c = "0";
		}
		String snum8c = chartService.countByMemberC("08");
		if (snum8c == null || snum8c.length() == 0) {
			snum8c = "0";
		}
		String snum9c = chartService.countByMemberC("09");
		if (snum9c == null || snum9c.length() == 0) {
			snum9c = "0";
		}
		String snum10c = chartService.countByMemberC("10");
		if (snum10c == null || snum10c.length() == 0) {
			snum10c = "0";
		}
		String snum11c = chartService.countByMemberC("11");
		if (snum11c == null || snum11c.length() == 0) {
			snum11c = "0";
		}
		String snum12c = chartService.countByMemberC("12");
		if (snum12c == null || snum12c.length() == 0) {
			snum12c = "0";
		}

		logger.info("1월 기업회원 가입자 수 ={}", snum1c);
		logger.info("2월 기업회원 가입자 수 ={}", snum2c);
		logger.info("3월 기업회원 가입자 수 ={}", snum3c);
		logger.info("4월 기업회원 가입자 수 ={}", snum4c);
		logger.info("5월 기업회원 가입자 수 ={}", snum5c);
		logger.info("6월 기업회원 가입자 수 ={}", snum6c);
		logger.info("7월 기업회원 가입자 수 ={}", snum7c);
		logger.info("8월 기업회원 가입자 수 ={}", snum8c);
		logger.info("9월 기업회원 가입자 수 ={}", snum9c);
		logger.info("10월 기업회원 가입자 수 ={}", snum10c);
		logger.info("11월 기업회원 가입자 수 ={}", snum11c);
		logger.info("12월 기업회원 가입자 수 ={}", snum12c);
		
		model.addAttribute("snum1c", snum1c);
		model.addAttribute("snum2c", snum2c);
		model.addAttribute("snum3c", snum3c);
		model.addAttribute("snum4c", snum4c);
		model.addAttribute("snum5c", snum5c);
		model.addAttribute("snum6c", snum6c);
		model.addAttribute("snum7c", snum7c);
		model.addAttribute("snum8c", snum8c);
		model.addAttribute("snum9c", snum9c);
		model.addAttribute("snum10c", snum10c);
		model.addAttribute("snum11c", snum11c);
		model.addAttribute("snum12c", snum12c);
		
		logger.info("성별별 회원수");
		
		String m = chartService.countByGenderM();
		if (m == null || m.length() == 0) {
			m = "0";
		}
		String f = chartService.countByGenderF();
		if (f == null || f.length() == 0) {
			f = "0";
		}
		
		logger.info("남성 회원수");
		logger.info("여성 회원수");
		
		
		model.addAttribute("m", m);
		model.addAttribute("f", f);
		
		logger.info("연령별, 성별별 회원수");
		
		//연령별 전체
		String one = chartService.countByAge(1);
		if (one == null || one.length() == 0) {
			one = "0";
		}
		String two = chartService.countByAge(2);
		if (two == null || two.length() == 0) {
			two = "0";
		}
		String three = chartService.countByAge(3);
		if (three == null || three.length() == 0) {
			three = "0";
		}
		String four = chartService.countByAge(4);
		if (four == null || four.length() == 0) {
			four = "0";
		}
		
		logger.info("{}대 전체 회원수 ={}", 10, one);
		logger.info("{}대 전체 회원수 ={}", 20, two);
		logger.info("{}대 전체 회원수 ={}", 30, three);
		logger.info("{}대 전체 회원수 ={}", 40, four);
		
		//남성
		String M10 = chartService.countByAgeM(1);
		if (M10 == null || M10.length() == 0) {
			M10 = "0";
		}
		String M20 = chartService.countByAgeM(2);
		if (M20 == null || M20.length() == 0) {
			M20 = "0";
		}
		String M30 = chartService.countByAgeM(3);
		if (M30 == null || M30.length() == 0) {
			M30 = "0";
		}
		String M40 = chartService.countByAgeM(4);
		if (M40 == null || M40.length() == 0) {
			M40 = "0";
		}
		
		logger.info("{}대 남성 회원수 ={}", 10, M10);
		logger.info("{}대 남성 회원수 ={}", 20, M20);
		logger.info("{}대 남성 회원수 ={}", 30, M30);
		logger.info("{}대 남성 회원수 ={}", 40, M40);
		
		//남성
		String F10 = chartService.countByAgeF(1);
		if (F10 == null || F10.length() == 0) {
			F10 = "0";
		}
		String F20 = chartService.countByAgeF(2);
		if (F20 == null || F20.length() == 0) {
			F20 = "0";
		}
		String F30 = chartService.countByAgeF(3);
		if (F30 == null || F30.length() == 0) {
			F30 = "0";
		}
		String F40 = chartService.countByAgeF(4);
		if (F40 == null || F40.length() == 0) {
			F40 = "0";
		}
		
		logger.info("{}대 여성 회원수 ={}", 10, F10);
		logger.info("{}대 여성 회원수 ={}", 20, F20);
		logger.info("{}대 여성 회원수 ={}", 30, F30);
		logger.info("{}대 여성 회원수 ={}", 40, F40);
		
		model.addAttribute("one", one);
		model.addAttribute("two", two);
		model.addAttribute("three", three);
		model.addAttribute("four", four);
		
		model.addAttribute("M10", M10);
		model.addAttribute("M20", M20);
		model.addAttribute("M30", M30);
		model.addAttribute("M40", M40);
		
		model.addAttribute("F10", F10);
		model.addAttribute("F20", F20);
		model.addAttribute("F30", F30);
		model.addAttribute("F40", F40);
		
		logger.info("차트 조회 완료!!!!!!!!!!");
		logger.info("차트 조회 완료!!!!!!!!!!");
	}
	
}
