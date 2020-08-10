package com.will.team4final.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


public class Utility {
	//paging 처리 관련 상수
	public static final int RECORD_COUNT=5; //한 페이지에 보여줄 레코드 개수
	public static final int BLOCKSIZE=10;	//블럭 크기 1~10
	
	//글 상세보기에 파일 정보 띄우기
	public static String getImageURL(String IMAGEURL,
			HttpServletRequest request) {
		//파일이미지 + 파일명 => 파일정보 리턴
		String result="";
		if(IMAGEURL!=null && !IMAGEURL.isEmpty()) {
			result="<img src='"+ request.getContextPath()
					+"/resources/images/file.gif' alt='파일 이미지'> ";
			result+= IMAGEURL;
		}
		
		return result;
	}
	
	//교집합 구하기
	public static <T> List<T> intersection(List<T> list1, List<T> list2) {
	    List<T> list = new ArrayList<T>();
	 
	    for (T t : list1) {
	        if (list2.contains(t)) {
	            list.add(t);
	        }
	    }
	 
	    return list;
	}

}
