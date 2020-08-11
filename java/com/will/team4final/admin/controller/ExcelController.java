package com.will.team4final.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;

@Controller
public class ExcelController {
	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);
	
	@Autowired 
	private MemberService memServ;
	
	public void excelDown(HttpServletResponse response) {
		List<MemberVO> memList = memServ.showMemberForExcel();
		logger.info("맴버 엑셀 다운로드, 맴버 수 = {}", memList.size());
		
		XSSFWorkbook wb = new XSSFWorkbook(); //xlsx 엑셀 2007 이상
		//HSSFWorkbook wb = new HSSFWorkbook(); //xls 엑셀 97~03
		
		Sheet sheet = wb.createSheet("회원 목록"); //시트명 설정
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;



	}
}
