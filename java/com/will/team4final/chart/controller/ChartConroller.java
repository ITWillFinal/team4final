package com.will.team4final.chart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		int snum1 = chartService.sumByMonth("01");
		int snum2 = chartService.sumByMonth("02");
		int snum3 = chartService.sumByMonth("03");
		int snum4 = chartService.sumByMonth("04");
		int snum5 = chartService.sumByMonth("05");
		int snum6 = chartService.sumByMonth("06");
		int snum7 = chartService.sumByMonth("07");
		int snum8 = chartService.sumByMonth("08");
		int snum9 = chartService.sumByMonth("09");
		int snum10 = chartService.sumByMonth("10");
		int snum11 = chartService.sumByMonth("11");
		int snum12 = chartService.sumByMonth("12");
		
		logger.info("1월 매출={}", snum1);
		logger.info("2월 매출={}", snum2);
		logger.info("3월 매출={}", snum3);
		logger.info("4월 매출={}", snum4);
		logger.info("5월 매출={}", snum5);
		logger.info("6월 매출={}", snum6);
		logger.info("7월 매출={}", snum7);
		logger.info("8월 매출={}", snum8);
		logger.info("9월 매출={}", snum9);
		logger.info("10월 매출={}", snum10);
		logger.info("11월 매출={}", snum11);
		logger.info("12월 매출={}", snum12);
		
		model.addAttribute("snum1", snum1);
		model.addAttribute("snum2", snum2);
		model.addAttribute("snum3", snum3);
		model.addAttribute("snum4", snum4);
		model.addAttribute("snum5", snum5);
		model.addAttribute("snum6", snum6);
		model.addAttribute("snum7", snum7);
		model.addAttribute("snum8", snum8);
		model.addAttribute("snum9", snum9);
		model.addAttribute("snum10", snum10);
		model.addAttribute("snum11", snum11);
		model.addAttribute("snum12", snum12);
		
		logger.info("월별 일반회원 증가율 보여주기");
		
		int msnum1 = chartService.countByMember("01");
		int msnum2 = chartService.countByMember("02");
		int msnum3 = chartService.countByMember("03");
		int msnum4 = chartService.countByMember("04");
		int msnum5 = chartService.countByMember("05");
		int msnum6 = chartService.countByMember("06");
		int msnum7 = chartService.countByMember("07");
		int msnum8 = chartService.countByMember("08");
		int msnum9 = chartService.countByMember("09");
		int msnum10 = chartService.countByMember("10");
		int msnum11 = chartService.countByMember("11");
		int msnum12 = chartService.countByMember("12");
		
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
		
		
		int snum1c = chartService.countByMemberC("01");
		int snum2c = chartService.countByMemberC("02");
		int snum3c = chartService.countByMemberC("03");
		int snum4c = chartService.countByMemberC("04");
		int snum5c = chartService.countByMemberC("05");
		int snum6c = chartService.countByMemberC("06");
		int snum7c = chartService.countByMemberC("07");
		int snum8c = chartService.countByMemberC("08");
		int snum9c = chartService.countByMemberC("09");
		int snum10c = chartService.countByMemberC("10");
		int snum11c = chartService.countByMemberC("11");
		int snum12c = chartService.countByMemberC("12");
		
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
		
		int m = chartService.countByGenderM();
		int f = chartService.countByGenderF();
		
		logger.info("남성 회원수");
		logger.info("여성 회원수");
		
		
		model.addAttribute("m", m);
		model.addAttribute("f", f);
		
		logger.info("연령별, 성별별 회원수");
		
		//연령별 전체
		int one = chartService.countByAge(1);
		int two = chartService.countByAge(2);
		int three = chartService.countByAge(3);
		int four = chartService.countByAge(4);
		
		logger.info("{}대 전체 회원수 ={}", 10, one);
		logger.info("{}대 전체 회원수 ={}", 20, two);
		logger.info("{}대 전체 회원수 ={}", 30, three);
		logger.info("{}대 전체 회원수 ={}", 40, four);
		
		//남성
		int M10 = chartService.countByAgeM(1);
		int M20 = chartService.countByAgeM(2);
		int M30 = chartService.countByAgeM(3);
		int M40 = chartService.countByAgeM(4);
		
		logger.info("{}대 남성 회원수 ={}", 10, M10);
		logger.info("{}대 남성 회원수 ={}", 20, M20);
		logger.info("{}대 남성 회원수 ={}", 30, M30);
		logger.info("{}대 남성 회원수 ={}", 40, M40);
		
		//남성
		int F10 = chartService.countByAgeF(1);
		int F20 = chartService.countByAgeF(2);
		int F30 = chartService.countByAgeF(3);
		int F40 = chartService.countByAgeF(4);
		
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
	}
		
	@RequestMapping("/priceByMonth.do")
	public void priceByMonth(Model model) {
		logger.info("월별 매출 차트 보여주기");
		
		int snum1 = chartService.sumByMonth("01");
		int snum2 = chartService.sumByMonth("02");
		int snum3 = chartService.sumByMonth("03");
		int snum4 = chartService.sumByMonth("04");
		int snum5 = chartService.sumByMonth("05");
		int snum6 = chartService.sumByMonth("06");
		int snum7 = chartService.sumByMonth("07");
		int snum8 = chartService.sumByMonth("08");
		int snum9 = chartService.sumByMonth("09");
		int snum10 = chartService.sumByMonth("10");
		int snum11 = chartService.sumByMonth("11");
		int snum12 = chartService.sumByMonth("12");
		
		logger.info("1월 매출={}", snum1);
		logger.info("2월 매출={}", snum2);
		logger.info("3월 매출={}", snum3);
		logger.info("4월 매출={}", snum4);
		logger.info("5월 매출={}", snum5);
		logger.info("6월 매출={}", snum6);
		logger.info("7월 매출={}", snum7);
		logger.info("8월 매출={}", snum8);
		logger.info("9월 매출={}", snum9);
		logger.info("10월 매출={}", snum10);
		logger.info("11월 매출={}", snum11);
		logger.info("12월 매출={}", snum12);
		
		model.addAttribute("snum1", snum1);
		model.addAttribute("snum2", snum2);
		model.addAttribute("snum3", snum3);
		model.addAttribute("snum4", snum4);
		model.addAttribute("snum5", snum5);
		model.addAttribute("snum6", snum6);
		model.addAttribute("snum7", snum7);
		model.addAttribute("snum8", snum8);
		model.addAttribute("snum9", snum9);
		model.addAttribute("snum10", snum10);
		model.addAttribute("snum11", snum11);
		model.addAttribute("snum12", snum12);
		
	}
	
	@RequestMapping("/memberByMonth.do")
	public void countByMember(Model model) {
		logger.info("월별 일반회원 증가율 보여주기");
		
		int snum1 = chartService.countByMember("01");
		int snum2 = chartService.countByMember("02");
		int snum3 = chartService.countByMember("03");
		int snum4 = chartService.countByMember("04");
		int snum5 = chartService.countByMember("05");
		int snum6 = chartService.countByMember("06");
		int snum7 = chartService.countByMember("07");
		int snum8 = chartService.countByMember("08");
		int snum9 = chartService.countByMember("09");
		int snum10 = chartService.countByMember("10");
		int snum11 = chartService.countByMember("11");
		int snum12 = chartService.countByMember("12");
		
		logger.info("1월 일반회원 가입자 수 ={}", snum1);
		logger.info("2월 일반회원 가입자 수 ={}", snum2);
		logger.info("3월 일반회원 가입자 수 ={}", snum3);
		logger.info("4월 일반회원 가입자 수 ={}", snum4);
		logger.info("5월 일반회원 가입자 수 ={}", snum5);
		logger.info("6월 일반회원 가입자 수 ={}", snum6);
		logger.info("7월 일반회원 가입자 수 ={}", snum7);
		logger.info("8월 일반회원 가입자 수 ={}", snum8);
		logger.info("9월 일반회원 가입자 수 ={}", snum9);
		logger.info("10월 일반회원 가입자 수 ={}", snum10);
		logger.info("11월 일반회원 가입자 수 ={}", snum11);
		logger.info("12월 일반회원 가입자 수 ={}", snum12);
		
		model.addAttribute("snum1", snum1);
		model.addAttribute("snum2", snum2);
		model.addAttribute("snum3", snum3);
		model.addAttribute("snum4", snum4);
		model.addAttribute("snum5", snum5);
		model.addAttribute("snum6", snum6);
		model.addAttribute("snum7", snum7);
		model.addAttribute("snum8", snum8);
		model.addAttribute("snum9", snum9);
		model.addAttribute("snum10", snum10);
		model.addAttribute("snum11", snum11);
		model.addAttribute("snum12", snum12);
		
		
		int snum1c = chartService.countByMemberC("01");
		int snum2c = chartService.countByMemberC("02");
		int snum3c = chartService.countByMemberC("03");
		int snum4c = chartService.countByMemberC("04");
		int snum5c = chartService.countByMemberC("05");
		int snum6c = chartService.countByMemberC("06");
		int snum7c = chartService.countByMemberC("07");
		int snum8c = chartService.countByMemberC("08");
		int snum9c = chartService.countByMemberC("09");
		int snum10c = chartService.countByMemberC("10");
		int snum11c = chartService.countByMemberC("11");
		int snum12c = chartService.countByMemberC("12");
		
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
		
	}

	@RequestMapping("/countByGender")
	public void countByGender(Model model) {
		logger.info("성별별 회원수");
		
		int m = chartService.countByGenderM();
		int f = chartService.countByGenderF();
		
		logger.info("남성 회원수");
		logger.info("여성 회원수");
		
		
		model.addAttribute("m", m);
		model.addAttribute("f", f);
	}
	
	@RequestMapping("/countByAgeG")
	public void countByAge(Model model) {
		logger.info("연령별, 성별별 회원수");
		
		//연령별 전체
		int one = chartService.countByAge(1);
		int two = chartService.countByAge(2);
		int three = chartService.countByAge(3);
		int four = chartService.countByAge(4);
		
		logger.info("{}대 전체 회원수 ={}", 10, one);
		logger.info("{}대 전체 회원수 ={}", 20, two);
		logger.info("{}대 전체 회원수 ={}", 30, three);
		logger.info("{}대 전체 회원수 ={}", 40, four);
		
		//남성
		int M10 = chartService.countByAgeM(1);
		int M20 = chartService.countByAgeM(2);
		int M30 = chartService.countByAgeM(3);
		int M40 = chartService.countByAgeM(4);
		
		logger.info("{}대 남성 회원수 ={}", 10, M10);
		logger.info("{}대 남성 회원수 ={}", 20, M20);
		logger.info("{}대 남성 회원수 ={}", 30, M30);
		logger.info("{}대 남성 회원수 ={}", 40, M40);
		
		//남성
		int F10 = chartService.countByAgeF(1);
		int F20 = chartService.countByAgeF(2);
		int F30 = chartService.countByAgeF(3);
		int F40 = chartService.countByAgeF(4);
		
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
	}
	
}
