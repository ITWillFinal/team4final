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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		logger.info("memberVo={}",memberVo);
		
		model.addAttribute("memberVo",memberVo);
		
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
	
	@RequestMapping("/resumeMain.do")
	public String resumeMain(HttpSession session, Model model) {
		logger.info("이력서 메인페이지");
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		logger.info("memberVo={}",memberVo);
		
		List<Map<String, Object>> resumeList = resumeService.selectResumeCareerViewByUserNo(memberVo.getUserNo());
		logger.info("{}이력서 조회 결과 list.size={}",userid,resumeList.size());
		logger.info("대표이력서={}, 공개여부={}",memberVo.getResumeNo(),memberVo.getYorn());
		
		model.addAttribute("resumeNo",memberVo.getResumeNo());
		model.addAttribute("yorn",memberVo.getYorn());
		model.addAttribute("resumeList",resumeList);
		
		return "resume/resumeMain";
	}
	
	@RequestMapping("/setRepResume.do")
	public String setRepResume(HttpSession session, @RequestParam(defaultValue = "-1") int resumeNo) {
		logger.info("대표이력서 설정, 파라미터 resumeNo={}",resumeNo);
		
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		memberVo.setResumeNo(Integer.toString(resumeNo));			
		
		int cnt = memberService.changeResumeNo(memberVo);
		logger.info("대표이력서 설정 결과 cnt={}",cnt);
		
		return "redirect:/resume/resumeMain.do";
	}

	@ResponseBody
	@RequestMapping("/resumeYorn.do")
	public String resumeYorn(HttpSession session, @RequestParam String yorn) {
		logger.info("대표이력서 공개 설정, 파라미터 yorn={}",yorn);
		
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		if(yorn.equals("true")) {
			memberVo.setYorn("Y");
		}else {
			memberVo.setYorn("N");			
		}
		logger.info("공개여부 : {}",memberVo.getYorn());
		
		int cnt = memberService.changeYorn(memberVo);
		logger.info("대표이력서 공개 설정 결과 cnt={}",cnt);
		
		return memberVo.getYorn();
	}

	@RequestMapping("/resumeDelete.do")
	public String resumeDelete(@RequestParam int resumeNo) {
		logger.info("이력서 삭제, 파라미터 resumeNo={}",resumeNo);
		
		int cnt = resumeService.deleteResume(resumeNo);
		logger.info("이력서 삭제, 결과 cnt={}",cnt);
		
		return "redirect:/resume/resumeMain.do";
	}

	@RequestMapping("/resumeDetail.do")
	public String resumeDetail(@RequestParam int resumeNo,
			HttpSession session, Model model) {
		logger.info("이력서 상세보기, 파라미터 resumeNo={}",resumeNo);
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		
		ResumeAllVO resumeAllVo = resumeService.selectResumeByResumNo(resumeNo);
		logger.info("이력서 조회결과 resumeAllVo={}",resumeAllVo);
		
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("resumeAllVo",resumeAllVo);
		return "resume/resumeDetail";
	}
	
	@RequestMapping(value = "/resumeEdit.do", method = RequestMethod.GET)
	public String resumeEdit_get(HttpSession session, Model model, @RequestParam int resumeNo) {
		logger.info("이력서 수정 페이지, 파라미터 resumeNo={}",resumeNo);
		
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectByUserid(userid);
		ResumeAllVO resumeAllVo = resumeService.selectResumeByResumNo(resumeNo);
		
		logger.info("memberVo={}",memberVo);
		logger.info("이력서 조회결과 resumeAllVo={}",resumeAllVo);
		
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("resumeAllVo",resumeAllVo);
		
		return "resume/resumeEdit";
	}
	
	@RequestMapping(value = "/resumeEdit.do", method = RequestMethod.POST)
	public String resumeEdit_post(@ModelAttribute ResumeVO resumeVo,
			@ModelAttribute EducationVO educationVo,
			@ModelAttribute CareerListVO careerListVo,
			@ModelAttribute ActiveListVO activeListVo,
			@ModelAttribute CertifyListVO certifyListVo,
			@ModelAttribute LanguageListVO languageListVo,
			@ModelAttribute AwardListVO awardListVo,
			@ModelAttribute AddinfoVO addInfoVo,
			@ModelAttribute PotfolioVO potfolioVo,
			HttpServletRequest request, Model model) {
		
		logger.info("이력서 수정, 파라미터 resumeVo={}",resumeVo);
		logger.info("이력서 수정, 파라미터 educationVo={}",educationVo);
		logger.info("이력서 수정, 파라미터 careerListVo={}",careerListVo);
		logger.info("이력서 수정, 파라미터 careerListVo={}",activeListVo);
		logger.info("이력서 수정, 파라미터 careerListVo={}",certifyListVo);
		logger.info("이력서 수정, 파라미터 careerListVo={}",languageListVo);
		logger.info("이력서 수정, 파라미터 careerListVo={}",awardListVo);
		logger.info("이력서 수정, 파라미터 careerListVo={}",addInfoVo);
		logger.info("이력서 수정, 파라미터 careerListVo={}",potfolioVo);
		
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
		logger.info("resumeAllVo 세팅 완료");
		int cnt = resumeService.updateResume(resumeAllVo);
		logger.info("이력서 수정 결과 cnt={}",cnt);
		String msg="이력서 수정에 실패하였습니다." , url ="/resume/resumeDetail.do?resumeNo="+resumeVo.getResumeNo();
		if(cnt>0) {
			msg="이력서가 수정되었습니다.";
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);		
		
		return "common/message";
	}
	
}
