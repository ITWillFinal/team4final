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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	@Autowired private BCryptPasswordEncoder pwdEncoder;
	
	
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
	@RequestMapping(value = "/googleLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("구글:" + url);

		model.addAttribute("google_url", url);

		/* 생성한 인증 URL을 View로 전달 */
		return "login/login";
	}
	
	// 구글 Callback호출 메소드
		@RequestMapping(value = "/oauth2callback.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String googleCallback(Model model, @RequestParam String code) throws IOException {
			System.out.println("여기는 googleCallback");

			return "googleSuccess";
		}


	
	

	
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
		String userid = (String) response_obj.get("email");
		logger.info("이름 = {}, 아이디 = {}", name, userid);
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("name", name); // 세션 생성
		session.setAttribute("userid", userid); // 세션 생성
		session.setAttribute("status", "U");
		model.addAttribute("result", apiResult);
		return "index";
	}

	

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session, Model model) throws IOException {
		logger.info("여기는 logout");
		String userid = (String)session.getAttribute("userid");
		
		String msg=userid + "님 로그아웃되었습니다.", url="/index.do";
		session.invalidate();
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping(value = "/companyLogout.do")
	public String companyLogout(HttpSession session) throws IOException {
		logger.info("여기는 logout");
		
		session.invalidate();
		
		return "redirect:/companypage/companyHome.do";
	}
	
	@RequestMapping("/userLogin.do")
	public String userLogin(@RequestParam(required = false) String pwd, @RequestParam(required = false) String userid, Model model,
			HttpServletRequest request) {
		logger.info("로그인 처리 userid={}, pwd={}", userid, pwd);
		String url = "/index.do", msg = "로그인시 오류!";
		
		MemberVO vo = new MemberVO();
		vo=memServ.selectByUserid(userid);
		if(vo==null) {
			msg="아이디가 없습니다";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "common/message";
		}
		
		//회원탈퇴 아이디 확인
		if(vo.getOutdate()!=null) {
			msg="회원탈퇴한 아이디입니다. 다시 회원가입해주세요.";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "common/message";
		}
		
		boolean pwdMatch = pwdEncoder.matches(pwd, vo.getPwd());
		logger.info("pwdMatch={}", pwdMatch);
		
		if (pwdMatch == true) {
			MemberVO memVo = memServ.selectByUserid(userid);

			msg = memVo.getUserName() + "님 취뽀하세요!";

			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("name", memVo.getUserName());
			session.setAttribute("status", memVo.getUserStatus());
			session.setAttribute("userNo", memVo.getUserNo());
		} else if (pwdMatch == false) {
			msg = "비밀번호가 다릅니다!";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "common/message";
	}
	
	@RequestMapping("/companyLogin.do")
	public String companyLogin(@RequestParam(required = false) String pwd, @RequestParam(required = false) String userid, Model model,
			HttpServletRequest request) {
		logger.info("기업 로그인 처리 userid={}, pwd={}", userid, pwd);
		String url = "/companypage/companyHome.do", msg = "기업 로그인시 오류!";
		CompanyMemberVO vo = new CompanyMemberVO();
		
		vo = comServ.selectCMemberInfoByUserid(userid);
		if(vo ==null) {
			msg="아이디가 없습니다.";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "common/message";
		}
		
		//회원탈퇴 아이디 확인
		if(vo.getcOutdate()!=null) {
			msg="회원탈퇴한 아이디입니다. 다시 회원가입해주세요.";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "common/message";
		}
		
		boolean pwdMatch = pwdEncoder.matches(pwd, vo.getcPwd());
		logger.info("pwdMatch={}", pwdMatch);
		
		if (pwdMatch == true) {
			CompanyMemberVO comVo = comServ.selectCMemberInfoByUserid(userid);
			
			msg = comVo.getcUsername() + "님 안녕하세요!";
			
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("name", comVo.getcUsername());
			session.setAttribute("status", comVo.getcUserStatus());
			session.setAttribute("cMemberCode", comVo.getcMemberCode());
		} else if (pwdMatch == false) {
			msg = "비밀번호가 다릅니다!";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
}
