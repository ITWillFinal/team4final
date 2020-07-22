package com.will.team4final.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
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
import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MemberService memServ;
	@Autowired
	private ComMemberService comServ;

	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	// 로그인 첫 화면 요청 메소드
	/*
	 * @RequestMapping(value = "/login.do", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String login(Model model, HttpSession session) {
	 * logger.info("로그인 화면");
	 * 
	 * 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 String
	 * naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); //
	 * https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE*****
	 * **********& //
	 * redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&
	 * state=e68c269c-5ba9-4c31-85da-54c16c658125 구글code 발행 OAuth2Operations
	 * oauthOperations = googleConnectionFactory.getOAuthOperations(); String url =
	 * oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
	 * googleOAuth2Parameters);
	 * 
	 * System.out.println("네이버:" + naverAuthUrl); System.out.println("구글:" + url);
	 * 
	 * // 네이버 model.addAttribute("url", naverAuthUrl);
	 * model.addAttribute("google_url", url);
	 * 
	 * return "login/login"; }
	 */
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;

		System.out.println("여기는 callback|| session = " + session + ", code = " + code + ", state = " + state);
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		System.out.println("oauthToken = " + oauthToken);
		// 1. 로그인 사용자 정보를 읽어온다.
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
		} catch (ParseException e) {
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
		return "login/login";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");

		return "#";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		logger.info("여기는 logout");
		
		session.invalidate();
		
		return "redirect:/index.do";
	}
	@RequestMapping(value = "/companyLogout.do")
	public String companyLogout(HttpSession session) throws IOException {
		logger.info("여기는 logout");
		
		session.invalidate();
		
		return "redirect:/companypage/companyHome.do";
	}
	
	@RequestMapping("/userLogin.do")
	public String userLogin(@RequestParam String pwd, @RequestParam String userid, Model model,
			HttpServletRequest request) {
		logger.info("로그인 처리 userid={}, pwd={}", userid, pwd);

		int result = memServ.loginCheck(userid, pwd);
		logger.info("로그인 result의 값은 = {}", result);

		String url = "/index.do", msg = "로그인시 오류!";
		if (result == MemberService.LOGIN_OK) {
			MemberVO memVo = memServ.selectAll(userid);

			msg = memVo.getUserName() + "님 취뽀하세요!";

			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("name", memVo.getUserName());
			session.setAttribute("status", memVo.getUserStatus());
		} else if (result == MemberService.PWD_DISAGREE) {
			msg = "비밀번호가 다릅니다!";
		} else if (result == MemberService.ID_NONE) {
			msg = "존재하지 않는 아이디입니다.!";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";
	}
	
	@RequestMapping("/companyLogin.do")
	public String companyLogin(@RequestParam String pwd, @RequestParam String userid, Model model,
			HttpServletRequest request) {
		logger.info("기업 로그인 처리 userid={}, pwd={}", userid, pwd);
		
		int result = comServ.comLoginCheck(userid, pwd);
		logger.info("기업 로그인 result의 값은 = {}", result);
		
		String url = "/companypage/companyHome.do", msg = "기업 로그인시 오류!";
		if (result == MemberService.LOGIN_OK) {
			CompanyMemberVO comVo = comServ.selectCMemberAll(userid);
			
			msg = comVo.getcUsername() + "님 안녕하세요!";
			
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("name", comVo.getcUsername());
			session.setAttribute("status", comVo.getcUserStatus());
		} else if (result == MemberService.PWD_DISAGREE) {
			msg = "비밀번호가 다릅니다!";
		} else if (result == MemberService.ID_NONE) {
			msg = "존재하지 않는 아이디입니다.!";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
}
