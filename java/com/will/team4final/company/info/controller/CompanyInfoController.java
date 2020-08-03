package com.will.team4final.company.info.controller;

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
	public void comInfoView() {
		logger.info("회사 정보 입력 화면");
	}
	
	@RequestMapping(value = "/companyInfoWrite.do", method = RequestMethod.POST)
	public String comInfoView_post(@ModelAttribute CompanyInfoVO vo, Model model, HttpSession session, 
			@RequestParam String comIndustry2
			,HttpServletRequest request) {
		String cUserid = (String)session.getAttribute("userid");
		logger.info("회사 정보 입력, 파라미터 cUserid={}, vo={}", cUserid, vo);
		CompanyMemberVO cMemberVo=comMemberService.selectCMemberInfoByUserid(cUserid);
		logger.info("아이디로 멤버 정보 불러오기 결과, cMemberVo={}", cMemberVo);
		
		if(comIndustry2!=null || !comIndustry2.isEmpty()) {
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
	
	
	
}
