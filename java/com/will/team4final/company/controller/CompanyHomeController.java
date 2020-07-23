package com.will.team4final.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.location.model.LocationService;
import com.will.team4final.login.controller.LoginController;

@Controller
@RequestMapping("/companypage")
public class CompanyHomeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired private ComMemberService cMemberSerice;
	@Autowired private JavaMailSender mailSender;

	@Autowired
	private LocationService locaServ;

	@RequestMapping("/companyHome.do")
	public String companyHome() {
		logger.info("기업페이지 홈");

		return "companypage/companyHome";
	}

	@RequestMapping("/member/companyJoin.do")
	public void companyJoin() {
		logger.info("기업회원가입 페이지");

	}

	@RequestMapping("/member/checkUserid.do")
	public String checkcUserid(@RequestParam String cUserid, Model model) {
		logger.info("기업회원 아이디 중복확인, 파라미터 cUserid={}", cUserid);
		if(cUserid==null || cUserid.isEmpty()) {
			return "companypage/member/checkUserid";
		}

		int result = cMemberSerice.selectCMemberDup(cUserid);

		logger.info("기업회원 아이디 중복확인 결과, result={}", result);
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID",ComMemberService.EXIST_ID);
		model.addAttribute("NON_EXIST_ID",ComMemberService.NON_EXIST_ID);

		return "companypage/member/checkUserid";

	}

	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String comRegister_post(@ModelAttribute CompanyMemberVO vo, Model model) {
		logger.info("기업회원 등록, 파라미터 vo={}", vo);

		int cnt = cMemberSerice.insertCMember(vo);
		logger.info("기업 회원 입력 결과 cnt={}", cnt);

		String msg="회원 가입 실패", url="/companypage/member/companyJoin.do";
		if(cnt>0) {
			msg="회원 가입 성공";
			url="/companypage/companyHome.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/companyWrite.do")
	public String companyWrite(Model model) {
		logger.info("기업페이지 채용공고등록");

		List<String> list = locaServ.sido();
		logger.info("지역 list = {}", list.size());

		model.addAttribute("list", list);
		return "companypage/companyWrite";
	}

	@RequestMapping("/companyResume.do")
	public String resume() {
		logger.info("기업페이지 자사 이력서양식 제작");

		return "companypage/companyResume";
	}

	@RequestMapping("/member/checkId.do")
	@ResponseBody
	public boolean cMemberCheckId(@RequestParam String cUserid1) {
		logger.info("기업회원 아이디 체크");

		int cnt = cMemberSerice.selectCMemberDup(cUserid1);
		logger.info("기업회원 아아디 체크 결과, cnt={}", cnt);
		
		
		boolean bool = false;
		if(cnt==ComMemberService.EXIST_ID) {
			bool=false;//이미 존재, 사용 불가
		}else if(cnt==ComMemberService.NON_EXIST_ID) {
			bool=true;//사용 가능
		}

		return bool;
	}

	@RequestMapping("/member/email.do")
	public void email() {
		logger.info("이메일 화면");
	}

	// mailSending 코드
	@RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST )
	public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)

		String setfrom = "dlgkstjq623@gamil.com";
		String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성

				System.getProperty("line.separator")+

				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

	        +System.getProperty("line.separator")+

	        System.getProperty("line.separator")+

	        " 인증번호는 " +dice+ " 입니다. "

	        +System.getProperty("line.separator")+

	        System.getProperty("line.separator")+

	        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용


		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/companypage/member/email_injeung");     //뷰의이름
		mv.addObject("dice", dice);
		mv.addObject("e_mail", e_mail);

		System.out.println("mv : "+mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

	//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	//틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/member/join_injeung.do", method = RequestMethod.POST)
	public ModelAndView join_injeung(@RequestParam String e_mail,@RequestParam String email_injeung, @RequestParam String dice, HttpServletResponse response_equals) throws IOException {
		System.out.println("마지막 : email_injeung : "+email_injeung);
		System.out.println("마지막 : dice : "+dice);
		System.out.println("마지막 : e_mail : "+e_mail);

		//페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
		ModelAndView mv = new ModelAndView();

		if (email_injeung.equals(dice)) {

			//인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
			mv.setViewName("companypage/member/email_injeung");
			mv.addObject("email",e_mail);

			//만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			//한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;


		}else if (email_injeung != dice) {
			ModelAndView mv2 = new ModelAndView(); 
			mv2.setViewName("company/member/email_injeung");
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();


			return mv2;

		}    

		return mv;
	}
}
