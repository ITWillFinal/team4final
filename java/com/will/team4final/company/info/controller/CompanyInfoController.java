package com.will.team4final.company.info.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.mail.imap.OlderTerm;
import com.will.team4final.common.FileUploadUtil;
import com.will.team4final.company.info.model.CompanyInfoService;
import com.will.team4final.company.info.model.CompanyInfoVO;
import com.will.team4final.company.model.ComMemberService;
import com.will.team4final.company.model.CompanyMemberVO;

@Controller
@RequestMapping("/companypage")
public class CompanyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyInfoController.class);

	@Autowired private ComMemberService comMemberService;
	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private CompanyInfoService companyInfoService;

	@RequestMapping(value = "/companyInfoWrite.do", method = RequestMethod.GET)
	public String comInfoView(HttpSession session, Model model) {
		logger.info("회사 정보 입력 화면");
		//회사 정보 입력 되어  있는지 확인
		String cUserid = (String)session.getAttribute("userid");
		String cMemberCode = comMemberService.selectMemberCode(cUserid);
		CompanyInfoVO comInfoVo = companyInfoService.selectComInfoBycMemberCode(cMemberCode);
		if(comInfoVo != null) {
			String msg="회사 정보가 입력되어 있습니다.", url="/companypage/MyCompany.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
			
		}
		return "companypage/companyInfoWrite";
	}

	@RequestMapping(value = "/companyInfoWrite.do", method = RequestMethod.POST)
	public String comInfoView_post(@ModelAttribute CompanyInfoVO vo, Model model, HttpSession session,
			@RequestParam String comIndustry2
			,HttpServletRequest request) {
		String cUserid = (String)session.getAttribute("userid");
		logger.info("회사 정보 입력, 파라미터 cUserid={}, vo={}", cUserid, vo);
		CompanyMemberVO cMemberVo=comMemberService.selectCMemberInfoByUserid(cUserid);
		logger.info("아이디로 멤버 정보 불러오기 결과, cMemberVo={}", cMemberVo);
		String comIndustry = vo.getComIndustry();
		if(comIndustry.equals("etc")) {
			vo.setComIndustry(comIndustry2);
		}

		vo.setcMemberCode(cMemberVo.getcMemberCode());
		//파일 업로드 처리
		List<Map<String, Object>> fileList
		=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_COMPANYINFO_IMAGE);

		String imageURL="";
		for(Map<String, Object> map : fileList) {
			imageURL=(String) map.get("fileName");
		}
		vo.setImageURL(imageURL);
		String msg="회사 정보 입력 실패 했습니다", url="/companypage/companyInfoWrite.do";
		int cnt  = companyInfoService.insertCompanyInfo(vo);
		logger.info("회사 입력 결과 cnt={}", cnt);
		if(cnt>0) {
			msg="회사 정보 입력 완료했습니다.";
			url="/companypage/companyHome.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";

	}

	//기업정보 조회하기
	@RequestMapping("/MyCompany.do")
	public void myComInfo(Model model, HttpSession session) {
		String cUserid = (String)session.getAttribute("userid");
		logger.info("조회 기업회원 아이디, userid= {}", cUserid);
		
		String cnt = comMemberService.selectMemberCode(cUserid);
		logger.info("{}의 c_member_code = {}", cUserid, cnt);
		
		CompanyInfoVO vo = companyInfoService.selectComInfoBycMemberCode(cnt);
		
		model.addAttribute("vo", vo);
		
	}
	
	//기업정보 수정하기 - GET
	@RequestMapping(value = "/MyCompanyEdit.do", method = RequestMethod.GET)
	public void EditMyComInfo(@RequestParam (defaultValue = "0") String comCode,
			HttpSession session, Model model) {
		logger.info("수정(GET)할 기업 정보 comCode = {}", comCode);
		
		String cUserid = (String)session.getAttribute("userid");
		
		String cnt = comMemberService.selectMemberCode(cUserid);
		logger.info("{}의 c_member_code = {}", cUserid, cnt);
		
		CompanyInfoVO vo = companyInfoService.selectComInfoBycMemberCode(cnt);
		logger.info("수정(GET)할 기업 정보 조회 vo={}", vo);
		
		model.addAttribute("comCode", comCode);
		model.addAttribute("vo", vo);
		
	}
	
	//기업정보 수정하기 - POST
	@RequestMapping(value = "/MyCompanyEdit.do", method = RequestMethod.POST)
	public String EditMyComInfo(@ModelAttribute CompanyInfoVO vo,
			@RequestParam (defaultValue = "0") String comCode,
			HttpServletRequest request, Model model) {
		logger.info("수정(POST)할 기업 정보 vo={}", vo);
		
		String msg = "기업정보 수정 실패", url ="/companypage/MycCompanyEdit.do?comCode="+vo.getComCode();
			//새로 파일 업로드한 경우, 기존 파일이 있으면 삭제 처리
			if(vo.getImageURL() != null && !vo.getImageURL().isEmpty()) {
				String upPath = fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_COMPANYINFO_IMAGE);
				File file = new File(upPath, vo.getImageURL());
				if(file.exists()) {
					boolean bool = file.delete();
					logger.info("파일 삭제 여부 : {}", bool);
				}
			}
			//파일 업로드
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_COMPANYINFO_IMAGE);
			
			String imageURL="";
			for(Map<String, Object> map : fileList) {
				imageURL=(String)map.get("fileName");
			}
			vo.setImageURL(imageURL);
			logger.info("파일 업로드 ? imageURL={}",imageURL);
			int cnt = companyInfoService.updateCominfoByCode(vo);
			logger.info("수정(POST) 결과 cnt = {}", cnt);
			
			msg = "기업정보를 수정 완료했습니다.";
			url = "/companypage/MyCompany.do";
		
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}


}
