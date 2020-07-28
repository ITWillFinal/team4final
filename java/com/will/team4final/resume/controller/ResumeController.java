package com.will.team4final.resume.controller;

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

import com.will.team4final.common.FileUploadUtil;
import com.will.team4final.member.model.MemberService;
import com.will.team4final.member.model.MemberVO;
import com.will.team4final.resume.model.ActiveListVO;
import com.will.team4final.resume.model.AddinfoVO;
import com.will.team4final.resume.model.AwardListVO;
import com.will.team4final.resume.model.CareerListVO;
import com.will.team4final.resume.model.CertifyListVO;
import com.will.team4final.resume.model.EducationVO;
import com.will.team4final.resume.model.LanguageListVO;
import com.will.team4final.resume.model.PotfolioVO;
import com.will.team4final.resume.model.ResumeAllVO;
import com.will.team4final.resume.model.ResumeService;
import com.will.team4final.resume.model.ResumeVO;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private final static Logger logger = LoggerFactory.getLogger(ResumeController.class);
	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private ResumeService resumeService;
	@Autowired private MemberService memberService;
	
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.GET)
	public String resumeWrite_get(HttpSession session, Model model) {
		logger.info("이력서 작성 페이지");
		
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectAll(userid);
		
		logger.info("memberVo={}",memberVo);
		
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("MALE",MemberService.MALE);
		model.addAttribute("FEMALE",MemberService.FEMALE);
		
		return "resume/resumeWrite";
	}
	
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.POST)
	public String resumeWrite_post(@ModelAttribute ResumeVO resumeVo,
			@ModelAttribute EducationVO educationVo,
			@ModelAttribute CareerListVO careerListVo,
			@ModelAttribute ActiveListVO activeListVo,
			@ModelAttribute CertifyListVO certifyListVo,
			@ModelAttribute LanguageListVO languageListVo,
			@ModelAttribute AwardListVO awardListVo,
			@ModelAttribute AddinfoVO addInfoVo,
			@ModelAttribute PotfolioVO potfolioVo,
			HttpServletRequest request, Model model) {
		
		logger.info("이력서 등록, 파라미터 resumeVo={}",resumeVo);
		logger.info("이력서 등록, 파라미터 educationVo={}",educationVo);
		logger.info("이력서 등록, 파라미터 careerListVo={}",careerListVo);
		logger.info("이력서 등록, 파라미터 careerListVo={}",activeListVo);
		logger.info("이력서 등록, 파라미터 careerListVo={}",certifyListVo);
		logger.info("이력서 등록, 파라미터 careerListVo={}",languageListVo);
		logger.info("이력서 등록, 파라미터 careerListVo={}",awardListVo);
		logger.info("이력서 등록, 파라미터 careerListVo={}",addInfoVo);
		logger.info("이력서 등록, 파라미터 careerListVo={}",potfolioVo);
		
		ResumeAllVO resumeAllVo = new ResumeAllVO();
		
		if(resumeVo !=null) {
			resumeAllVo.setResumeVo(resumeVo);
		}
		
		if(educationVo!=null) {
			resumeAllVo.setEducationVo(educationVo);
		}
		
		if(careerListVo!=null) {
			resumeAllVo.setCareerVoList(careerListVo.getCareerItems());
		}
		
		if(activeListVo!=null) {
			resumeAllVo.setActiveVoList(activeListVo.getActiveItems());
		}

		if(certifyListVo!=null) {
			resumeAllVo.setCertifyVoList(certifyListVo.getCertifyItems());
		}
		
		if(languageListVo!=null) {
			resumeAllVo.setLanguageVoList(languageListVo.getLanguageItems());
		}
		
		if(awardListVo!=null) {
			resumeAllVo.setAwardVoList(awardListVo.getAwardItems());
		}
		
		if(addInfoVo!=null) {
			resumeAllVo.setAddInfoVo(addInfoVo);
		}
		
		if(potfolioVo!=null) {
			
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDS);
			
			String potFile = "";
			
			for(Map<String, Object> map : fileList) {
				potFile=(String) map.get("fileName");
			}
			
			potfolioVo.setPotFile(potFile);
			resumeAllVo.setPotfolioVo(potfolioVo);
		}
		
		int cnt = resumeService.insertResume(resumeAllVo);
		logger.info("이력서 등록 결과 cnt={}",cnt);
		String msg="이력서 등록에 실패하였습니다." , url ="/resume/resumeMain.do";
		if(cnt>0) {
			msg="이력서가 등록되었습니다.";
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);		
		
		return "common/message";
	}
	
	@RequestMapping(value = "/resumeMain.do")
	public String resumeMain(HttpSession session, Model model) {
		logger.info("이력서 메인페이지");
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectAll(userid);
		logger.info("memberVo={}",memberVo);
		
		List<ResumeVO> resumeList = resumeService.selectResumeByUserNo(Integer.toString(memberVo.getUserNo()));
		logger.info("{}이력서 조회 결과 list.size={}",userid,resumeList.size());
		
		model.addAttribute("resumeList",resumeList);
		
		return "resume/resumeMain";
	}
	
	
}
