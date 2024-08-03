package kr.or.ddit.controller.recruiter;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IApplicaintStatisticsService;
import kr.or.ddit.service.IApplicantMgmtService;
import kr.or.ddit.service.IMyCorpMgmtService;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/statistics")
public class ApplicantStatisticsController {
	
	@Inject
	private IApplicaintStatisticsService statisticsService;
	
	@Inject 
	private IApplicantMgmtService applicantMgmtService;
	
	@Inject
	private IMyCorpMgmtService myCorpMgmtService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(
			@RequestParam(name="recNtcId", required=false) String recNtcId,
			Principal principal,
			Model model 
			) {
		log.info("main() 실행...!");
		
		if(principal==null) {
			return "redirect:/login";
		}
		String memId = principal.getName();
		String corpId = myCorpMgmtService.getCrpIdByMemId(memId);
		
		// 공고 제목
		List<RecruitmentNoticeVO> recNtcList = applicantMgmtService.getRecNtcList(corpId);
		log.info("recNtcList >> " + recNtcList);
		model.addAttribute("recNtcList", recNtcList);
		
		// 전체 조회수
		int totalViews = statisticsService.getTotalViews();
		model.addAttribute("totalViews", totalViews);
		
		// 전체 지원자 수
		int totalApply = statisticsService.getTotalApply();
		model.addAttribute("totalApply", totalApply);
		
		// 경력자 수
		int totalExpPerson = statisticsService.getTotalExpPerson();
		model.addAttribute("totalExpPerson", totalExpPerson);
		
		// 신입 수
		int totalNewComer = statisticsService.getTotalNewComer();
		model.addAttribute("totalNewComer", totalNewComer);
		
		return "corp/recruiter/statistics";
	};
	
	@ResponseBody
	@RequestMapping(value="/applicantByDay", method=RequestMethod.GET)
	public ResponseEntity<?> applicantByDay(){
		log.info("applicantByDay() 실행...!");
		List<ApplyVO> applyListByDay = statisticsService.getApplicantByDay();
		Map<String, Object> response = new HashMap<>();
		response.put("applyListByDay", applyListByDay);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/applicantByEdu", method=RequestMethod.GET)
	public ResponseEntity<?> applicantByEdu(){
		log.info("applicantByEdu() 실행...!");
		List<ApplyVO> applyListByEdu = statisticsService.getApplicantByEdu();
		log.info("applyListByEdu >> " + applyListByEdu);
		Map<String, Object> response = new HashMap<>();
		response.put("applyListByEdu", applyListByEdu);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/applicantByMajor", method=RequestMethod.GET)
	public ResponseEntity<?> applicantByMajor(){
		log.info("applicantByMajor() 실행...!");
		List<ApplyVO> applyListByMajor = statisticsService.getApplicantByMajor();
		log.info("applyListByMajor >> " + applyListByMajor);
		Map<String, Object> response = new HashMap<>();
		response.put("applyListByMajor", applyListByMajor);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
}
