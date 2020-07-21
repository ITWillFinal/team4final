package com.will.team4final.email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.team4final.member.model.MemberService;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired private EmailSender emailSender;
	@Autowired private MemberService memberService;
	
	@RequestMapping("/find_id.do")
	public String emailSend(@RequestParam String findIdByEmail) {
		logger.info("아이디 찾기 메일 발송처리");
		
		String userid = memberService.findId(findIdByEmail);
		
		
		String subject="아이디 찾기에 대한 답변입니다";
		String content="고객님의 아이디는" + userid + "입니다";
		String receiver=findIdByEmail;
		String sender="admin@herbmall.com";
		
		String msg="이메일 전송 실패했습니다", url="/index.do";
		try {
			emailSender.mailSend(subject, content, receiver, sender);
			logger.info("이메일 발송 성공!");
			msg="이메일 전송 성공했습니다";
		} catch (AddressException e) {
			e.printStackTrace();
			logger.info("이메일 발송 실패!");
		}catch (MessagingException e) {
			e.printStackTrace();
			logger.info("이메일 발송 실패!");
		}
		
		return "common/message";
	}
}
