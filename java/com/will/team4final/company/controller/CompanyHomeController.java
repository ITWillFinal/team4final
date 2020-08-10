package com.will.team4final.company.controller;

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

import com.will.team4final.common.Utility;
import com.will.team4final.company.info.model.CompanyInfoService;
import com.will.team4final.company.info.model.CompanyInfoVO;
import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.company.model.ComrRecruitListVO;
import com.will.team4final.company.model.Recruitment_TosVO;
import com.will.team4final.jobkinds.model.JobService;
import com.will.team4final.location.model.LocationService;
import com.will.team4final.login.controller.LoginController;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.resume.model.ResumeAllVO;
import com.will.team4final.resume.model.ResumeService;
import com.will.team4final.resume.model.ResumeTalentVO;
import com.will.team4final.scrap.model.ComScrapService;

@Controller
@RequestMapping("/companypage")
public class CompanyHomeController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private ComMemberService cMemberSerice;
	@Autowired
	private LocationService locaServ;
	@Autowired
	private ComRecruitService comRecruitService;
	@Autowired
	private JobService jobServ;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private CompanyInfoService comInfoService;
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private ComRecruitService comRecruitServ;
	@Autowired
	private ComScrapService comScrapServ;
	@Autowired private BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping("/companyHome.do")
	public String companyHome() {
		logger.info("기업페이지 홈");

		return "companypage/companyHome";
	}

	@RequestMapping("/member/companyJoin.do")
	public void companyJoin() {
		logger.info("기업회원가입 페이지");

	}

	@RequestMapping("/serviceInfo.do")
	public void serviceInfo() {
		logger.info("기업회원 서비스안내");
	}

	@RequestMapping("/member/email.do")
	public String email() {
		logger.info("이메일 화면");
		return "/companypage/member/email";
	}

	// mailSending 코드
	@RequestMapping(value = "/member/auth.do", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "dlgkstjq623@gamil.com";
		String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/companypage/member/email_injeung"); // 뷰의이름
		mv.addObject("dice", dice);
		mv.addObject("e_mail", e_mail);

		System.out.println("mv : " + mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/member/join_injeung.do", method = RequestMethod.POST)
	public ModelAndView join_injeung(@RequestParam String e_mail, @RequestParam String email_injeung,
			@RequestParam String dice, HttpServletResponse response_equals) throws IOException {
		System.out.println("마지막 : email_injeung : " + email_injeung);
		System.out.println("마지막 : dice : " + dice);
		System.out.println("마지막 : e_mail : " + e_mail);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
		ModelAndView mv = new ModelAndView();

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
			mv.setViewName("/companypage/member/email_injeung");
			mv.addObject("email", e_mail);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("/companypage/member/email_injeung");
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;

		}

		return mv;
	}

	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String comRegister_post(@ModelAttribute CompanyMemberVO vo, Model model) {
		logger.info("기업회원 등록, 파라미터 vo={}", vo);

		//비밀번호 암호화
		String inputPass = vo.getcPwd();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setcPwd(pwd);
		
		int cnt = cMemberSerice.insertCMember(vo);
		logger.info("기업 회원 입력 결과 cnt={}", cnt);

		String msg = "회원 가입 실패", url = "/companypage/member/companyJoin.do";
		if (cnt > 0) {
			msg = "회원 가입 성공";
			url = "/companypage/companyHome.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping(value = "/companyWrite.do", method = RequestMethod.GET)
	public String companyWrite_get(Model model, HttpSession session) {
		logger.info("기업페이지 채용공고 등록 페이지");
		// 회사 정보 미 입력시 채용 정보 등록 못하게 하기
		String cUserid = (String) session.getAttribute("userid");
		logger.info("cUserid={}", cUserid);
		CompanyMemberVO comMemberVo = cMemberSerice.selectCMemberInfoByUserid(cUserid);
		logger.info("기업공고 페이지 회원 정보 조회, comMemberVo={}", comMemberVo);
		CompanyInfoVO comInfoVo = comInfoService.selectComInfoBycMemberCode(comMemberVo.getcMemberCode());
		logger.info("기업공고 페이지 회사 정보 입력 값 확인, comInfoVo={}", comInfoVo);

		String comCode = comInfoVo.getComCode();
		String msg = "먼저 회사 정보 입력 부탁드립니다", url = "/companypage/companyInfoWrite.do";

		if (comCode == null || comCode.isEmpty()) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}

		// 회사정보 불러와서 출력할 값 받아오기
		String comName = comInfoVo.getComName();
		String zipcode = comInfoVo.getZipcode();
		String address = comInfoVo.getAddress();
		String addressDetail = comInfoVo.getAddressDetail();
		logger.info("comName={}", comName);
		logger.info("zipcode={}", zipcode);
		logger.info("address={}", address);
		logger.info("addressDetail={}", addressDetail);

		// 지역 정보 받아오기
		List<String> list = locaServ.sido();
		logger.info("지역 list = {}", list.size());

		List<Map<String, Object>> induList = jobServ.selectInduLarge();
		List<Map<String, Object>> jobList = jobServ.selectLarge();
		logger.info("직무, 산업 list = {}, {}", jobList.size(), induList.size());

		model.addAttribute("comCode", comCode);
		model.addAttribute("list", list);
		model.addAttribute("induList", induList);
		model.addAttribute("jobList", jobList);

		// 회사정보 불러와서 출력해주기 => jsp에서는 해당 태그에 value=${} 로 넣어준다
		model.addAttribute("comName", comName);
		model.addAttribute("zipcode", zipcode);
		model.addAttribute("address", address);
		model.addAttribute("addressDetail", addressDetail);

		return "companypage/companyWrite";

	}

	@RequestMapping(value = "/companyWrite.do", method = RequestMethod.POST)
	public String companyWrite_post(@ModelAttribute ComRecruitVO vo, Model model, HttpSession session) {
		logger.info("기업 채용 등록, 파라미터 vo={}", vo);
		// 시퀀스 값 미리 가져오기
		String recruitmentCode = comRecruitService.selectrecruitmentCode();
		vo.setRecruitmentCode(recruitmentCode);

		String jobType = vo.getJobType1();
		String induType = vo.getInduType1();

		String jobType1 = jobServ.selectInduLargeName(induType);
		String induType1 = jobServ.selectJobLargeName(jobType);
		logger.info("타입 1 이름 = {}, {}", jobType1, induType1);

		vo.setJobType1(induType1);
		vo.setInduType1(jobType1);

		// 기업 채용 공고 등록
		int cnt = comRecruitService.insertComRecruit(vo);
		logger.info("기업 채용 공고 결과 cnt={}", cnt);

		String msg = "기업 채용 공고 실패", url = "/companypage/companyWrite.do";
		if (cnt > 0) {
			msg = "기업 채용 공고 성공";
			url = "/companypage/companyWritePeriod.do?recruitmentCode=" + recruitmentCode;
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping(value = "/companyWritePeriod.do", method = RequestMethod.GET)
	public String companyWritePeriod_get(Model model, @RequestParam(required = false) String recruitmentCode,
			HttpSession session) {
		logger.info("기업회원 채용공고 기간 페이지");

		// 회사 정보 미 입력시 채용 정보 등록 못하게 하기

		if (recruitmentCode == null || recruitmentCode.isEmpty()) {
			String cUserid = (String) session.getAttribute("userid");
			CompanyMemberVO comMemberVo = cMemberSerice.selectCMemberInfoByUserid(cUserid);
			logger.info("기업회원 채용공고 기간 페이지 회원 정보 조회, comMemberVo={}", comMemberVo);
			CompanyInfoVO comInfoVo = comInfoService.selectComInfoBycMemberCode(comMemberVo.getcMemberCode());
			logger.info("기업회원 채용공고 기간 페이지 회사 정보 입력 값 확인, comInfoVo={}", comInfoVo);
			String comCode = comInfoVo.getComCode();
			// comCode에 맞는 RecruitmenetCode가 있는지확인
			ComRecruitVO comRecruitVo = comRecruitService.selectBycomCode(comCode);
			recruitmentCode = comRecruitVo.getRecruitmentCode();
			String msg = "먼저 채용 정보 입력 부탁드립니다", url = "/companypage/companyWrite.do";
			if (recruitmentCode == null || recruitmentCode.isEmpty()) {
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "common/message";
			}
		}

		model.addAttribute("recruitmentCode", recruitmentCode);
		return "companypage/companyWritePeriod";
	}

	@RequestMapping("/member/checkId.do")
	@ResponseBody
	public int cMemberCheckId(@RequestParam String cUserid1) {
		logger.info("기업회원 아이디 체크");

		int cnt = cMemberSerice.selectCMemberDup(cUserid1);
		logger.info("기업회원 아아디 체크 결과, cnt={}", cnt);

		return cnt;

	}

	@RequestMapping("/employmentNotice/employmentNoticeList.do")
	public String employmentNoticeList(HttpSession session, Model model) {
		
		// 회원 아이디로 회원 코드 가져와소 => company_info를 조회
		String cUserid = (String) session.getAttribute("userid");
		CompanyMemberVO companyMemberVo = cMemberSerice.selectCMemberInfoByUserid(cUserid);
		String cMemberCode = companyMemberVo.getcMemberCode();
		logger.info("cMemberCode={}", cMemberCode);
		CompanyInfoVO companyInfoVO = comInfoService.selectComInfoBycMemberCode(cMemberCode);
		// companyInfoVO에서 comCode 조회 해서 recruitment 데이터 가져오기
		String comCode = companyInfoVO.getComCode();
		logger.info("comCode={}", comCode);
		List<Recruitment_TosVO> list = comRecruitService.selectList_tosByComcode(comCode);
		logger.info("list={}", list);
		
		model.addAttribute("list", list);
		return "companypage/employmentNotice/employmentNoticeList";
	}

	@RequestMapping("/employmentNotice/deleteMulti.do")
	public String delMulti(@ModelAttribute ComrRecruitListVO comrRecruitListVO, Model model) {
		logger.info("선택 게시글 삭제, 파라미터 comrRecruitListVO={}", comrRecruitListVO);

		List<ComRecruitVO> list = comrRecruitListVO.getComrRecruitList();
		logger.info("list.size={}", list.size());
		int cnt = comRecruitService.deleteMulti(list);
		logger.info("선택한 항목 삭제 결과 cnt = {}", cnt);

		String msg = "", url = "/companypage/employmentNotice/employmentNoticeList.do";
		if (cnt > 0) {
			msg = "선택한 게시글을 삭제했습니다.";

			for (int i = 0; i < list.size(); i++) {
				ComRecruitVO vo = list.get(i);
				logger.info("i={}", i);
				logger.info("recruitmentCode={}", vo.getRecruitmentCode());

			}
		} else {
			msg = "선택한 항목 삭제 실패했습니다. ";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/searchTalent.do")
	public String searchTalent() {
		logger.info("기업페이지-인재검색");

		return "companypage/searchTalent";
	}

	@ResponseBody
	@RequestMapping("/searchTalentResume.do")
	public List<ResumeTalentVO> searchTalentResume(@RequestParam String jobtype,
			@RequestParam(defaultValue = "0") int careerYear, @RequestParam(required = false) String location,
			@RequestParam(required = false) String sal) {
		logger.info("인재 이력서 번호 검색 파라미터 jobtype={}, careerYear={}", jobtype, careerYear);
		logger.info("location={}, sal={}", location, sal);

		List<ResumeTalentVO> resumeTalentVoList = new ArrayList<ResumeTalentVO>();

		List<Integer> list1 = resumeService.searchTalent(jobtype);

		if (careerYear != 0) {
			List<Integer> list2 = resumeService.searchTalentByCareerYear(careerYear);
			list1 = Utility.intersection(list1, list2);
		}

		if (location != null) {
			List<Integer> list3 = resumeService.searchTalentByLocation(location);
			list1 = Utility.intersection(list1, list3);
		}

		if (sal != null) {
			List<Integer> list4 = resumeService.searchTalentBySal(sal);
			list1 = Utility.intersection(list1, list4);
		}

		for (int i = 0; i < list1.size(); i++) {
			ResumeTalentVO resumeTalentVo = resumeService.selectResumeTalent(list1.get(i));
			resumeTalentVoList.add(resumeTalentVo);
		}
		return resumeTalentVoList;
	}
	
	@RequestMapping("/talentResumeDetail.do")
	   public String talentResumeDetail(@RequestParam int resumeNo,Model model) {
	      logger.info("기업 - 인재검색 - 이력서 상세 페이지, 파라미터 resumeNo={}",resumeNo);

	      
	      ResumeAllVO resumeAllVo = resumeService.selectResumeByResumNo(resumeNo);
	      logger.info("이력서 조회결과 resumeAllVo={}",resumeAllVo);
	      resumeAllVo.getResumeVo().getResumeNo();
	      MemberVO memberVo = resumeService.selectMemberByResumeNo(resumeNo);

	      model.addAttribute("memberVo", memberVo);
	      model.addAttribute("resumeAllVo",resumeAllVo);
	      
	      return "companypage/talentResumeDetail";
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "/requestToJoin.do", produces = "application/text; charset=utf8")
	   public String requestToJoin(@RequestParam List<Integer> resumeNoList,
	         HttpSession session) {
	      logger.info("입사요청 resumeNoList.size={}",resumeNoList.size());
	      
	      String cMemberCode=(String)session.getAttribute("cMemberCode");
	      logger.info("기업 회원 코드 = {}",cMemberCode);
	      
	      String result = resumeService.requestToJoinMulti(resumeNoList, cMemberCode);
	      return result;
	   }

	@RequestMapping(value = "/employmentNotice/companyReWrite.do", method = RequestMethod.GET)
	public void companyReWrite_get(@RequestParam String recruitmentCode, Model model, HttpSession session) {
		logger.info("채용 정보 수정 화면, 파라미터 recruitmentCode={}", recruitmentCode);

		ComRecruitVO comRecruitVo = comRecruitService.selectOneByRecruitmentCode(recruitmentCode);
		logger.info("채용 정보 가져온거 확인, comRecruitVo={}", comRecruitVo);

		// 회사정보 불러와서 출력할 값 받아오기
		String cUserid = (String) session.getAttribute("userid");
		logger.info("cUserid={}", cUserid);
		CompanyMemberVO comMemberVo = cMemberSerice.selectCMemberInfoByUserid(cUserid);
		logger.info("기업공고 페이지 회원 정보 조회, comMemberVo={}", comMemberVo);
		CompanyInfoVO comInfoVo = comInfoService.selectComInfoBycMemberCode(comMemberVo.getcMemberCode());
		logger.info("기업공고 페이지 회사 정보 입력 값 확인, comInfoVo={}", comInfoVo);

		String comCode = comInfoVo.getComCode();
		String comName = comInfoVo.getComName();
		String zipcode = comInfoVo.getZipcode();
		String address = comInfoVo.getAddress();
		String addressDetail = comInfoVo.getAddressDetail();
		logger.info("comName={}", comName);
		logger.info("zipcode={}", zipcode);
		logger.info("address={}", address);
		logger.info("addressDetail={}", addressDetail);

		// 지역 정보 받아오기
		List<String> list = locaServ.sido();
		logger.info("지역 list = {}", list.size());

		List<Map<String, Object>> induList = jobServ.selectInduLarge();
		List<Map<String, Object>> jobList = jobServ.selectLarge();
		logger.info("직무, 산업 list = {}, {}", jobList.size(), induList.size());

		model.addAttribute("list", list);
		model.addAttribute("induList", induList);
		model.addAttribute("jobList", jobList);

		// 회사정보 불러와서 출력해주기 => jsp에서는 해당 태그에 value=${} 로 넣어준다
		model.addAttribute("comCode", comCode);
		model.addAttribute("comName", comName);
		model.addAttribute("zipcode", zipcode);
		model.addAttribute("address", address);
		model.addAttribute("addressDetail", addressDetail);

		//
		model.addAttribute("comRecruitVo", comRecruitVo);

	}

	@RequestMapping(value = "/companyReWrite.do", method = RequestMethod.POST)
	public String companyReWrite_post(@ModelAttribute ComRecruitVO vo, Model model, HttpSession session) {
		logger.info("기업 채용 수정 , 파라미터 vo={}", vo);

		String jobType = vo.getJobType1();
		String induType = vo.getInduType1();

		String jobType1 = jobServ.selectInduLargeName(induType);
		String induType1 = jobServ.selectJobLargeName(jobType);
		logger.info("타입 1 이름 = {}, {}", jobType1, induType1);

		vo.setJobType1(induType1);
		vo.setInduType1(jobType1);

		// 기업 채용 재공고 등록
		int cnt = comRecruitService.updateComRecruit(vo);
		logger.info("기업 채용 수정 결과 cnt={}", cnt);

		String msg = "기업 채용 수정 실패", url = "/companypage/companyReWrite.do?" + vo.getRecruitmentCode();
		if (cnt > 0) {
			msg = "기업 채용 수정 성공";
			url = "/companypage/employmentNotice/employmentNoticeList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/employmentNotice/employmentNoticeDelete.do")
	public String employmentNoticeDelete(@RequestParam String recruitmentCode, Model model) {
		logger.info("채용 정보 삭제 화면, 파라미터 recruitmentCode={}", recruitmentCode);
		String msg = "기업 정보 삭제 실패 했습니다", url = "";
		int cnt = comRecruitService.deleteOne(recruitmentCode);

		if (cnt > 0) {
			msg = "기업 채용 삭제 성공";
			url = "/mypage/mypageHome.do?status=C";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/searchTalentManagement.do")
	public String searchTalentManagement(HttpSession session, Model model) {
		 logger.info("기업 - 입사요청 관리페이지");
	      
	      String cMemberCode=(String)session.getAttribute("cMemberCode");
	      logger.info("기업 회원 코드 = {}",cMemberCode);
	      
	      List<List<ResumeTalentVO>> list = resumeService.perscrapList(cMemberCode);
	      
	      model.addAttribute("list",list);
	      
	      return "companypage/searchTalentManagement";
	}
	
	@ResponseBody
	   @RequestMapping(value = "/requestDelete.do", produces = "application/text; charset=utf8")
	   public String requestDelete(@RequestParam List<Integer> resumeNoListforDel,
	         HttpSession session) {
	      logger.info("입사요청 취소 resumeNoListforDel.size={}",resumeNoListforDel.size());
	      
	      String cMemberCode=(String)session.getAttribute("cMemberCode");
	      logger.info("기업 회원 코드 = {}",cMemberCode);
	      
	      String result = resumeService.deletePerscrapMulti(resumeNoListforDel, cMemberCode);
	      
	      return result;
	   }

	@ResponseBody
	@RequestMapping(value = "/yesToJoin.do", produces = "application/text; charset=utf8")
	public String yesToJoin(@RequestParam List<Integer> resumeNoListforJoin,
			HttpSession session) {
		logger.info("입사 희망요청 처리 resumeNoListforJoin.size={}",resumeNoListforJoin.size());
		
		String cMemberCode=(String)session.getAttribute("cMemberCode");
		logger.info("기업 회원 코드 = {}",cMemberCode);
		
		String result = resumeService.updatePerscrapStatusMulti(resumeNoListforJoin, cMemberCode,"JOIN");
		
		return result;
	}
	
	@RequestMapping(value = "/cMemberEdit.do", method = RequestMethod.GET)
	public void cMemberEdit_get(HttpSession session, Model model) {
		String cUserid = (String)session.getAttribute("userid");
		CompanyMemberVO cMemberVo=cMemberSerice.selectCMemberInfoByUserid(cUserid);
		logger.info("회사 회원 정보 수정 화면, cMemberVo={}", cMemberVo );
		
		model.addAttribute("cMemberVo", cMemberVo);
	}
	
	@RequestMapping("/checkPwd.do")
	@ResponseBody
	public boolean checkPwd(@RequestParam String cPwd, HttpSession session) {
		String cUserid = (String)session.getAttribute("userid");
		CompanyMemberVO cMemberVo = cMemberSerice.selectCMemberInfoByUserid(cUserid);
		
		boolean pwdMatch = pwdEncoder.matches(cPwd, cMemberVo.getcPwd());
		logger.info("pwdMatch={}", pwdMatch);
		
		return pwdMatch;
	}
	
	@RequestMapping(value = "/cMemberEdit.do", method = RequestMethod.POST)
	public String cMemberEdit_post(@ModelAttribute CompanyMemberVO companyMemberVo,@RequestParam String cMemberCode, Model model) {
		logger.info("기업 회원 정보 수정, 파라미터 cMemberCode={}, comMemberVo={}", cMemberCode, companyMemberVo);
		companyMemberVo.setcMemberCode(cMemberCode);
		int cnt = cMemberSerice.updateCMember(companyMemberVo);
		String msg="회원 정보 수정 실패했습니다.", url="/companypage/cMemberEdit.do";
		if(cnt>0) {
			msg="회원 정보 수정 성공했습니다.";
			url="/mypage/mypageHome.do?status=C";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
}
