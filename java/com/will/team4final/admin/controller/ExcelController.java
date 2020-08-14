package com.will.team4final.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.payment.model.PaymentService;

@Controller
public class ExcelController {
	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);
	
	@Autowired 
	private MemberService memServ;
	@Autowired
	private PaymentService paymentServ;
	
	@RequestMapping("/memberExel.do")
	public void memberExcelDown(HttpServletResponse response) throws IOException {
		List<MemberVO> memList = memServ.showMemberForExcel();
		logger.info("맴버 엑셀 다운로드, 맴버 수 = {}", memList.size());
		
		XSSFWorkbook wb = new XSSFWorkbook(); //xlsx 엑셀 2007 이상
		//HSSFWorkbook wb = new HSSFWorkbook(); //xls 엑셀 97~03
		
		Sheet sheet = wb.createSheet("회원 목록"); //시트명 설정
		
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    String[] col = {"회원번호", "아이디", "이름", "이메일", "전화번호", "생년월일", "성별", "가입일", "탈퇴일", "유저상태"};
	    row = sheet.createRow(rowNo++);
	    for (int i = 0; i < col.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(col[i]);
			cell.setCellStyle(cellStyle(wb, "head"));
		}
	    
	    for (MemberVO vo : memList) {
	    	 row = sheet.createRow(rowNo++);
	    	 int cellIdx = 0;
	    	 
	    	 //data 출력
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getUserNo());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getUserid());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getUserName());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getEmail());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getHp());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getBirth());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getGender());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getRegdate());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getOutdate());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
	    	 
	    	 cell = row.createCell(cellIdx++);
	    	 cell.setCellValue(vo.getUserStatus());
	    	 cell.setCellStyle(cellStyle(wb, "data"));
		}
	    
	    response.setContentType("application/vnd.ms-excel");
	    response.setHeader("Content-Disposition", "attachment;filename=member.xls");
	    
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	@RequestMapping("/paymentExel.do")
	public void paymentExcelDown(HttpServletResponse response) throws IOException {
		List<Map<String, Object>> payList = paymentServ.selectPamentForView();
		logger.info("결재 엑셀 다운로드, 결재내역 수 = {}", payList.size());
		
		XSSFWorkbook wb = new XSSFWorkbook(); //xlsx 엑셀 2007 이상
		//HSSFWorkbook wb = new HSSFWorkbook(); //xls 엑셀 97~03
		
		Sheet sheet = wb.createSheet("결재내역"); //시트명 설정
		
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		String[] col = {"결제번호", "기업 ID", "기업명", "회원명", "공고시작일", "공고종료일", "결제일", "결제금액"};
		row = sheet.createRow(rowNo++);
		for (int i = 0; i < col.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(col[i]);
			cell.setCellStyle(cellStyle(wb, "head"));
		}
		
		for (Map<String, Object> map : payList) {
			row = sheet.createRow(rowNo++);
			int cellIdx = 0;
			
			//data 출력
			cell = row.createCell(cellIdx++);
			cell.setCellValue((String)map.get("RECRUITMENT_CODE"));
			cell.setCellStyle(cellStyle(wb, "data"));
			
			cell = row.createCell(cellIdx++);
			cell.setCellValue((String)map.get("C_USERID"));
			cell.setCellStyle(cellStyle(wb, "data"));
			
			cell = row.createCell(cellIdx++);
			cell.setCellValue((String)map.get("COM_NAME"));
			cell.setCellStyle(cellStyle(wb, "data"));
			
			cell = row.createCell(cellIdx++);
			cell.setCellValue((String)map.get("C_USERNAME"));
			cell.setCellStyle(cellStyle(wb, "data"));
			
			cell = row.createCell(cellIdx++);
			cell.setCellValue((String)map.get("START_DATE"));
			cell.setCellStyle(cellStyle(wb, "data"));
			
			cell = row.createCell(cellIdx++);
			cell.setCellValue((String)map.get("END_DATE"));
			cell.setCellStyle(cellStyle(wb, "data"));
			
			cell = row.createCell(cellIdx++);
			cell.setCellValue((String)map.get("REGDATE"));
			cell.setCellStyle(cellStyle(wb, "data"));
			
			cell = row.createCell(cellIdx++);
			cell.setCellValue(Integer.parseInt(map.get("PRICE").toString()));
			cell.setCellStyle(cellStyle(wb, "data"));
			
		}
		
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=payment.xls");
		
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	//셀 스타일 설정하는 함수
	public static CellStyle cellStyle(XSSFWorkbook wb, String kind) {
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HorizontalAlignment.CENTER); //가운데 정렬
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); //중앙 정렬
		//경계선 설정
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		
		if(kind.equals("head")) {
			cellStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex()); //노란색
			cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND); //색상 패턴처리
		}else if(kind.equals("data")) {
			cellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex()); //회색 25%
			cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND); //색상 패턴처리
		}
		
		return cellStyle;
	}
}
