package com.will.team4final.email;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.CompanyMemberVO;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Autowired private EmailSender emailSender;
	@Autowired private MemberService memberService;
	@Autowired private ComMemberService cMemberService;

	@RequestMapping("/find_id.do")
	public String findId(@RequestParam String findIdByEmail,@RequestParam String memberType, Model model) {
		logger.info("아이디 찾기 메일 발송처리, 파라미터 findIdByEmail={}, memberType={}", findIdByEmail, memberType);
		
		String msg="이메일 전송 실패했습니다", url="/index.do";
		if(memberType.equals("u")) {
			String userid = memberService.findId(findIdByEmail);
			logger.info("userid={}", userid);
			
			String subject="아이디 찾기에 대한 답변입니다";
			String content="고객님의 아이디는 " + userid + " 입니다";
			String receiver=findIdByEmail;
			String sender="admin@herbmall.com";
			
			if(userid != null || !userid.isEmpty()) {
				try {
					emailSender.mailSend(subject, content, receiver, sender);
					logger.info("이메일 발송 성공!");
					msg="귀하의 이메일 주소로 아이디를 발송 하였습니다";
				} catch (AddressException e) {
					e.printStackTrace();
					logger.info("이메일 발송 실패!");
				}catch (MessagingException e) {
					e.printStackTrace();
					logger.info("이메일 발송 실패!");
				}
				
			}
			
		}else if(memberType.equals("c")) {
			String cUserid = cMemberService.findCMemberId(findIdByEmail);
			logger.info("userid={}", cUserid);
			
			String subject="아이디 찾기에 대한 답변입니다";
			String content="고객님의 아이디는 " + cUserid + " 입니다";
			String receiver=findIdByEmail;
			String sender="admin@herbmall.com";
			
			if(cUserid!=null || !cUserid.isEmpty()) {
				try {
					emailSender.mailSend(subject, content, receiver, sender);
					logger.info("이메일 발송 성공!");
					msg="귀하의 이메일 주소로 아이디를 발송 하였습니다";
				} catch (AddressException e) {
					e.printStackTrace();
					logger.info("이메일 발송 실패!");
				}catch (MessagingException e) {
					e.printStackTrace();
					logger.info("이메일 발송 실패!");
				}
				
			}//if
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/find_pwd.do")
	public String findPwd(@RequestParam String findPwdByEmail,@RequestParam String userid,
			@RequestParam String memberType, Model model) {
		logger.info("비밀번호 찾기, 파라미터 findPwdByEmail={}, userid={}", findPwdByEmail, userid);
		logger.info("파라미터 memberType={}", memberType);
		
		String msg="", 	url="/index.do";
		if(memberType.equals("u")) {
			String dbUserid = memberService.findId(findPwdByEmail);
			logger.info("dbUserid={}", dbUserid);

			MemberVO userVo = memberService.selectAll(dbUserid);
			logger.info("userVo={}", userVo);

			if(dbUserid!=null) {
				if(!userid.equals(dbUserid)) {
					logger.info("가입된 아이디와 일치하지 않는 곳");
					msg="입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다";
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
					return "common/message";
				}else {
					logger.info("가입된 아이디해서  int로 답 구하기 전");
					int ran = new Random().nextInt(100000)+10000;
					String password = Integer.toString(ran);
					MemberVO vo = new MemberVO();
					vo.setUserid(dbUserid);
					vo.setPwd(password);
					vo.setUserName(userVo.getUserName());
					logger.info("random 값, 파라미터 ran={}", ran);
					logger.info("vo set 결과, 파라미터 vo={}", vo);


					int result = memberService.updatePwdByEmail(vo);
					logger.info("패스워드 변경 결과 result={}", result);

					String subject="임시 비밀번호 발급 안내 입니다";
					String content="고객님의 비밀번호는 " + password + " 입니다";
					String receiver=findPwdByEmail;
					String sender="admin@herbmall.com";
					try {
						emailSender.mailSend(subject, content, receiver, sender);
						logger.info("이메일 발송 성공!");
					} catch (AddressException e) {
						e.printStackTrace();
						logger.info("이메일 발송 실패!");
					}catch (MessagingException e) {
						e.printStackTrace();
						logger.info("이메일 발송 실패!");
					}
					
				}

				msg="귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다";
			}else {
				msg="귀하의 이메일로 가입된 아이디가 존재하지 않습니다";
			}
		}else if(memberType.equals("c")) {
			String dbUserid =cMemberService.findCMemberId(findPwdByEmail);
			logger.info("dbUserid={}", dbUserid);
			
			if(dbUserid!=null) {
				if(!userid.equals(dbUserid)) {
					logger.info("가입된 아이디와 일치하지 않는 곳");
					msg="입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다";
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
					return "common/message";
				}else {
					logger.info("가입된 아이디해서  int로 답 구하기 전");
					int ran = new Random().nextInt(100000)+10000;
					String password = Integer.toString(ran);
					CompanyMemberVO vo = new CompanyMemberVO();
					vo.setcUserid(dbUserid);
					vo.setcPwd(password);
					logger.info("random 값, 파라미터 ran={}", ran);
					logger.info("vo set 결과, 파라미터 vo={}", vo);
					
					int result = cMemberService.updateCMemberPwdByEmail(vo);
					logger.info("패스워드 변경 결과 rsult={}", result);
					
					String subject="임시 비밀번호 발급 안내 입니다";
					String content="고객님의 비밀번호는 " + password + " 입니다";
					String receiver=findPwdByEmail;
					String sender="admin@herbmall.com"; 
					try {
						emailSender.mailSend(subject, content, receiver, sender);
						logger.info("이메일 발송 성공!");
					} catch (AddressException e) {
						e.printStackTrace();
						logger.info("이메일 발송 실패!");
					}catch (MessagingException e) {
						e.printStackTrace();
						logger.info("이메일 발송 실패!");
					}
				}//if
				
				
				msg="귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다";
			}else {
				msg="귀하의 이메일로 가입된 아이디가 존재하지 않습니다";
			}
			
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}

}
