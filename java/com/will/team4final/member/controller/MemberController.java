	package com.will.team4final.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.will.team4final.apply.model.ApplyService;
import com.will.team4final.apply.model.ApplyVO;
import com.will.team4final.common.FileUploadUtil;
import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.company.model.Recruitment_TosVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private MemberService memberService;
	@Autowired private JavaMailSender mailSender;
	@Autowired private BCryptPasswordEncoder pwdEncoder;
	@Autowired private ComRecruitService comRecruitServ;
	
	
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public void memberRegister_get() {
		logger.info("개인회원 등록 화면");

	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String memberRegister_post(@ModelAttribute MemberVO vo,HttpServletRequest request ,Model model) {
		logger.info("개인회원 등록, 파라미터 vo={}", vo);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList
		=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PERSONAL_IMAGE);

		String imageURL="";
		for(Map<String, Object> map : fileList) {
			imageURL=(String) map.get("fileName");
		}
		vo.setImageURL(imageURL);
		
		//비밀번호 암호화
		String inputPass = vo.getPwd();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setPwd(pwd);
		
		int cnt = memberService.insertMember(vo);
		logger.info("개인 회원 입력 결과 cnt={}", cnt);
		String msg="회원 가입 실패", url="/member/register.do";
		if(cnt>0) {
			msg="회원 가입 성공";
			url="/index.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/checkUserid.do")
	public String chkUserid(@RequestParam String user_id, Model model) {
		logger.info("개인회원 아이디 중복확인, 파라미터  user_id={}", user_id);
		if(user_id==null || user_id.isEmpty()) {
			return "member/checkUserid";
		}

		int result = memberService.selectMemberDup(user_id);
		logger.info("개인회원 아이디 중복확인 결과, result={}", result);
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID",MemberService.EXIST_ID);
		model.addAttribute("NON_EXIST_ID",MemberService.NON_EXIST_ID);

		return "member/checkUserid";
	}

	@RequestMapping("/email.do")
	public String email() {
		logger.info("이메일 화면");
		return "member/email";
	}

	// mailSending 코드
	@RequestMapping( value = "/auth.do" , method=RequestMethod.POST )
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
		mv.setViewName("/member/email_injeung");     //뷰의이름
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
	@RequestMapping(value = "/join_injeung.do", method = RequestMethod.POST)
	public ModelAndView join_injeung(@RequestParam String e_mail,@RequestParam String email_injeung, @RequestParam String dice, HttpServletResponse response_equals) throws IOException {
		System.out.println("마지막 : email_injeung : "+email_injeung);
		System.out.println("마지막 : dice : "+dice);
		System.out.println("마지막 : e_mail : "+e_mail);
			
		//페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
		ModelAndView mv = new ModelAndView();

		if (email_injeung.equals(dice)) {

			//인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
			mv.setViewName("member/email_injeung");
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
			mv2.setViewName("member/email_injeung");
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();


			return mv2;

		}    

		return mv;
	}
	
	@RequestMapping("/register/checkId.do")
	@ResponseBody
	public int checkId(@RequestParam String userid1) {
		logger.info("controller에서 값, userid1={}", userid1);
		int cnt = memberService.selectMemberDup(userid1);
		
		logger.info("controller창에서 int={}", cnt);
		return cnt;
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(@RequestParam String userNo, Model model) {
		logger.info("관리자 페이지에서 회원 삭제, 파라미터 userNo={}", userNo);
		int cnt = memberService.deleteUser(userNo);
		String msg="회원 삭제 실패했습니다", url="/admin/adminMemberManagement.do";
		if(cnt>0) {
			msg="회원 삭제 성공했습니다";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
			
	@RequestMapping(value = "/memberOut.do", method = RequestMethod.GET)
	public void memberOut_get(HttpSession session, Model model) {
		logger.info("일반회원 탈퇴 페이지");
		String userid = (String)session.getAttribute("userid");
		MemberVO vo = memberService.selectByUserid(userid);
		logger.info("일반회원 탈퇴 vo memberVo={}", vo);
		model.addAttribute("vo", vo);		
	}
	
	@RequestMapping(value = "/memberOut.do", method = RequestMethod.POST)
	public String companyOut_post(@RequestParam String userNo, @RequestParam String password, HttpSession session, Model model) {
		logger.info("일반회원 탈퇴 처리");				
		logger.info("일반회원넘버 userNo={}", userNo);		
		String userid = (String)session.getAttribute("userid");
		MemberVO vo = memberService.selectByUserid(userid);
		
		boolean pwdMatch = pwdEncoder.matches(password, vo.getPwd());
		logger.info("pwdMatch={}", pwdMatch);
		
		String msg="비밀번호가 일치하지 않습니다.", url="/member/memberOut.do";
		if (pwdMatch == true) {
			msg="일반회원 탈퇴 실패했습니다.";
			int cnt = memberService.deleteUser(userNo);
			logger.info("처리결과 cnt={}", cnt);
			if(cnt>0) {
				msg="일반회원 탈퇴 성공했습니다.";
				url="/";
				session.invalidate();
			}
		}		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";		
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(@RequestParam(defaultValue = "0") int userNo, Model model) {
		logger.info("관리자에서 회원 정보 변경 창 열기, 파라미터 userNo={}", userNo);		
		return "member/updateUser";
	}
	
	@RequestMapping("/agreement/personTerm.do")
	public String personTerm() {
		logger.info("개인 회원 약관 동의서 페이지");			
		return "agreement/personTerm";
	}
	
	@RequestMapping("/agreement/personInfo.do")
	public String personInfo() {
		logger.info("개인 회원 정보 수집  동의서 페이지");			
		return "agreement/personInfoCollaction";
	}
	
	@RequestMapping(value = "/memberEdit.do", method =RequestMethod.GET)
	public void memberEdit_get(HttpSession session, Model model) {
		logger.info("멤버 회원 수정 화면 ");
		//아이디로 멤버 정보 조회
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);		
		model.addAttribute("memberVo", memberVo);
	}
	
	@RequestMapping("/memberEdit/checkPwd.do")
	@ResponseBody
	public boolean checkPwd(@RequestParam String pwd, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		boolean pwdMatch = pwdEncoder.matches(pwd, memberVo.getPwd());
		logger.info("pwdMatch={}", pwdMatch);
		
		return pwdMatch;
	}
	
	@RequestMapping(value = "/memberEdit.do", method = RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO memberVo, Model model, HttpSession session) {
		logger.info("회원 정보 수정, 파라미터 memberVo={}", memberVo);
		
		String userNo = (String)session.getAttribute("userNo");
		String msg="", url="";
		if(userNo ==null || userNo.isEmpty()) {
			msg="로그인 해주세요.";
			url="/index.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		memberVo.setUserNo(userNo);
		int cnt = memberService.updateMember(memberVo);
		logger.info("회원 정보 수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg="회원 정보 수정되었습니다";
			url="/mypage/mypageHome.do?status=U";
		}else {
			msg="회원 정보 수정 실패 했습니다";
			url="/member/memberEdit.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/currentApply.do")
	public String currentApply(HttpSession session, Model model) {
		String userNo = (String)session.getAttribute("userNo");
		logger.info("일반 회원 지원 현황, userNo={}", userNo);
		
		//지원 정보 가져오기(여러개면 여러개)
		List<ApplyVO> applyListVo = memberService.selectApplyByuserNo(userNo);
		logger.info("지원 정보, applyListVo={}", applyListVo);
		
		//여러개 있는 것을 _tos에 담기
		List<Recruitment_TosVO> tosVo = new ArrayList<Recruitment_TosVO>();
		for(ApplyVO list : applyListVo ) {
			//하나씩 가져와서 담기
			Recruitment_TosVO vo = comRecruitServ.selectOneCom(list.getRecruitmentCode());
			 tosVo.add(vo);
		}
		logger.info("tosVo={}", tosVo);
		
		
		model.addAttribute("tosVo", tosVo);
		model.addAttribute("applyListVo", applyListVo);
		
		return "member/currentApply/currentApply";
	}
	
}
