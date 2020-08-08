package com.will.team4final.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.company.model.Recruitment_TosVO;
import com.will.team4final.jobkinds.model.JobService;
import com.will.team4final.location.model.LocationService;
import com.will.team4final.location.model.LocationVO;
import com.will.team4final.login.controller.LoginController;
import com.will.team4final.login.controller.NaverLoginBO;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	@Autowired
	private ComRecruitService comRecruitServ;
	
	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@RequestMapping(value = "/index.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String index(Model model, HttpSession session) {
		logger.info("메인화면");
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		logger.info("네이버 : {}", naverAuthUrl);
		logger.info("구글 : {}", url);
		
		List<Recruitment_TosVO> reVo = comRecruitServ.selectMost5();
		logger.info("모스트 5 공고 = {}", reVo.size());
		
		//네이버
		model.addAttribute("url", naverAuthUrl);
		model.addAttribute("google_url", url);
		model.addAttribute("reVo", reVo);
		
		return "index";
	}
	
	// 네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
				throws IOException {
			logger.info("콜백 화면, 파라미터 code = {}, state = {}", code, state);
			OAuth2AccessToken oauthToken;
			
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			logger.info("oauthToken = {}", oauthToken);
			
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
			/**
			 * apiResult json 구조 {"resultcode":"00", "message":"success",
			 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			 **/
			// 2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = null; 
			try { 
				obj = parser.parse(apiResult); 
			} catch(ParseException e) { 
				e.printStackTrace(); 
			}
			
			JSONObject jsonObj = (JSONObject) obj;
			// 3. 데이터 파싱
			// Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
			// response의 nickname값 파싱
			String name = (String) response_obj.get("name");
			System.out.println(name);
			// 4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId", name); // 세션 생성
			model.addAttribute("result", apiResult);
			
			return "index";
		}
		
		// 구글 Callback호출 메소드
		@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String googleCallback(Model model, @RequestParam String code) throws IOException {
			System.out.println("여기는 googleCallback");

			return "#";
		}
}
