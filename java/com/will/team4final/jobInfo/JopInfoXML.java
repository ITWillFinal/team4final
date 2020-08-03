package com.will.team4final.jobInfo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class JopInfoXML {
	private static final Logger logger
		= LoggerFactory.getLogger(JopInfoXML.class);
	
	@RequestMapping("/jobInfo/JOPINFO.do")
	public void sampleXml() {
		logger.info("도로명주소 xml 화면 보여주기");
	}
	
    @RequestMapping(value="/sample/getJob.do")
    public void getAddrApi(HttpServletRequest req, ModelMap model, HttpServletResponse response) throws Exception {
		// 요청변수 설정
    	String currentPage = req.getParameter("currentPage");    //요청 변수 설정 (현재 페이지. currentPage : n > 0)
		String countPerPage = req.getParameter("countPerPage");  //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
		String confmKey = req.getParameter("confmKey");          //요청 변수 설정 (승인키)
		String keyword = req.getParameter("dong");            //요청 변수 설정 (키워드)
		
		// OPEN API 호출 URL 정보 설정
					   //http://openapi.work.go.kr/opi/opi/opia/jobSrch.do?authKey=WNKCN2PH7I14BCQ2Z6VHW2VR1HK&returnType=XML&target=JOBCD
		String apiUrl = "http://openapi.work.go.kr/opi/opi/opia/jobSrch.do?authKey="+confmKey+"&returnType=XML&target=JOBCD";
		URL url = new URL(apiUrl);
    	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));//xml페이지를 openStream으로 받아오는데 utf-8로 인코딩 맞춘거임
    	StringBuffer sb = new StringBuffer();
    	String tempStr = null;

    	while(true){
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);								// 응답결과 XML 저장
    	}
    	br.close();
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());			// 응답결과 반환
    }
    
    @RequestMapping("/mapTest123.do")
    private String testmapTest() {
		return "testTest/mapTest";
	}
}
