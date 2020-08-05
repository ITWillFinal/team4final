package com.will.team4final.hireinfo.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.team4final.company.model.ComRecruitService;
import com.will.team4final.company.model.ComRecruitVO;
import com.will.team4final.jobkinds.model.JobService;
import com.will.team4final.location.model.LocationService;
import com.will.team4final.login.controller.LoginController;
import com.will.team4final.scrap.model.ComScrapService;
import com.will.team4final.scrap.model.ComScrapVO;

@Controller
@RequestMapping("/hireinpo")
public class HireInfoController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LocationService locationServ;
	@Autowired
	private JobService jobServ;
	@Autowired
	private ComRecruitService comRecuritServ;
	@Autowired
	private ComScrapService comScrapServ;
	
	@RequestMapping("/hireinpo.do")
	public String hireinpoHome(Model model) {
		logger.info("채용정보 홈");
		
		List<String> locationList = locationServ.sido();
		List<Map<String, Object>> jobList = jobServ.selectLarge();
		List<Map<String, Object>> induList = jobServ.selectInduLarge();
		
		model.addAttribute("locationList", locationList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("induList", induList);
		
		return "hireinpo/hireinpo";
	}
	
	@RequestMapping("/infoDetail.do")
	public String updateCount(@RequestParam String recruitmentCode, Model model) {
		logger.info("기업 채용 디테일 조회수 up!, 파라미터 recruitmentCode = {}", recruitmentCode);
		int cnt = comRecuritServ.updateReadCount(recruitmentCode);
		logger.info("조회수 증가 결과 = {}", cnt);
		
		return "redirect:/hireinpo/infoDetailGo.do?recruitmentCode="+recruitmentCode;
	}
	
	@RequestMapping("/infoDetailGo.do")
	public String infoDetail(@RequestParam String recruitmentCode, Model model, HttpServletRequest request) {
		logger.info("기업 채용 디테일, 파라미터 recruitmentCode = {}", recruitmentCode);
		
		ComRecruitVO vo = comRecuritServ.selectOneCom(recruitmentCode);
		logger.info("채용 vo = {}", vo);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userid") != null) {
			String userNo = (String)session.getAttribute("userNo");
			ComScrapVO comScrapVo = new ComScrapVO();
			comScrapVo.setRecruitmentCode(recruitmentCode);
			comScrapVo.setUserNo(userNo);
			int result = comScrapServ.selectComScrapById(comScrapVo);
			logger.info("기업을 스크랩 했는가? {}", result);
			model.addAttribute("result", result);
		}
		
		model.addAttribute("vo", vo);
		
		return "hireinpo/infoDetail";
	}
	
	@RequestMapping("/searchHireInfo.do")
	@ResponseBody
	public List<ComRecruitVO> searchHireInfo(@ModelAttribute ComRecruitVO comRecVo) {
		logger.info("채용정보 검색 vo = {}", comRecVo);
		List<ComRecruitVO> list = comRecuritServ.recruitmentDetailList(comRecVo);
		logger.info("list size = {}", list.size());
		return list;
	}
	
	@RequestMapping("/infoSearchByLocation.do")
	public void infoSearchByLocation(Model model) {
		logger.info("지역별 채용정보");
		List<String> locationList = locationServ.sido();
		model.addAttribute("locationList", locationList);
	}
}
