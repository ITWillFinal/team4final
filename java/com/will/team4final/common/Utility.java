package com.will.team4final.common;

import javax.servlet.http.HttpServletRequest;


public class Utility {
	//paging 처리 관련 상수
	public static final int RECORD_COUNT=5; //한 페이지에 보여줄 레코드 개수
	public static final int BLOCKSIZE=10;	//블럭 크기 1~10
	
	//글 상세보기에 파일 정보 띄우기
	public static String getFileInfo(String originFileName,
			HttpServletRequest request) {
		//파일이미지 + 파일명 => 파일정보 리턴
		String result="";
		if(originFileName!=null && !originFileName.isEmpty()) {
			result="<img src='"+ request.getContextPath()
					+"/resources/images/file.gif' alt='파일 이미지'> ";
			result+= originFileName;
		}
		
		return result;
	}
}