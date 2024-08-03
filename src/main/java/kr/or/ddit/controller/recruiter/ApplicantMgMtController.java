package kr.or.ddit.controller.recruiter;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IMyCorpMgmtMapper;
import kr.or.ddit.service.IApplicantMgmtService;
import kr.or.ddit.service.IMyCorpMgmtService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AnswerCodingTestVO;
import kr.or.ddit.vo.AnswerSelfIntroVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.CertificationVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/applicant")
public class ApplicantMgMtController {
	
	@Inject
	private IApplicantMgmtService applicantMgmtService;
	
	@Inject
	private IMyCorpMgmtService myCorpMgmtService;
	
	/**
	 *  전체 지원자 리스트 출력
	 */
	@PreAuthorize("hasRole('ROLE_RECRUITER')")
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String totalApplyList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name="recNtcId", required = false) String recNtcId,
			@RequestParam(name="applicantStatusCode", required = false) String applicantStatusCode,
 			Model model,
 			Principal principal
			) {
		log.info("totalApplyList() 실행... ");
		
		if(principal==null) {
			return "redirect:/login";
		}
		String memId = principal.getName();
		String corpId = myCorpMgmtService.getCrpIdByMemId(memId);
		
		
		PaginationInfoVO<ApplyVO> pagingVO = new PaginationInfoVO<ApplyVO>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setMemId(memId);
		if (recNtcId != null && !(recNtcId.equals(""))) {
			pagingVO.setRecNtcId(recNtcId); // 전체 공고 ID 설정
		}
		
		if(applicantStatusCode!=null && !(applicantStatusCode.equals(""))) {
			pagingVO.setApplicantStatusCode(applicantStatusCode); // 지원자 상태코드 설정
		}
		
		int totalRecord = applicantMgmtService.selectApplyCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		log.info("totalRecord -> {} ", totalRecord);
		
		
		List<ApplyVO> dataList = applicantMgmtService.selectApplyList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		
		List<RecruitmentNoticeVO> recNtcList = applicantMgmtService.getRecNtcList(corpId);			
		
		// 오늘 날짜 String화
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); 

        // 공고 상태 set해주기
        for (RecruitmentNoticeVO notice : recNtcList) {
            // 여기서 공고마감, 공고전 , D-day 표시하기
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String endDate = notice.getRecNtcEnd();
            String startDate = notice.getRecNtcStart();
            String today = todayString;
            
            try {
				Date endDateDate = dateFormat.parse(endDate);
				Date startDateDate = dateFormat.parse(startDate);
            	Date todayDate = dateFormat.parse(today);
				
            	if (todayDate.before(startDateDate)) {
            	    notice.setStatus("공고대기중");
            	} else if (todayDate.after(endDateDate)) {
            	    notice.setStatus("공고마감");
            	} else {
            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
            		int lastDay = (int)diffDay;
            		notice.setStatus("D-" + lastDay);
            	}
            	
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
		        
		model.addAttribute("recNtcList", recNtcList);
		return "corp/recruiter/applicantList";
	}
	
	/**
	 * 지원자 진행 상태별 Sorting
	 */
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_RECRUITER')")
	@RequestMapping(value="/oneApplyList", method = RequestMethod.POST)
	public ResponseEntity<?> oneApplyList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestBody Map<String, String> map,
			Principal principal
			){
		log.info("oneApplyList() 실행...! ");

		String memId = principal.getName();
		String corpId = myCorpMgmtService.getCrpIdByMemId(memId);
		
		String applicantStatusCode = map.get("applicantStatusCode");
		String recNtcId = map.get("recNtcId");
		
		PaginationInfoVO<ApplyVO> pagingVO = new PaginationInfoVO<ApplyVO>();	
		pagingVO.setMemId(memId);
		pagingVO.setCurrentPage(currentPage);
		
		if(recNtcId != null && !recNtcId.equals("")) {
			pagingVO.setRecNtcId(recNtcId);
		}
		
		if(applicantStatusCode != null && !applicantStatusCode.equals("")) {
			pagingVO.setApplicantStatusCode(applicantStatusCode);
		}
		
		int totalRecord = applicantMgmtService.selectApplyCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		log.info("totalRecord -> {} ", totalRecord);
		
		List<ApplyVO> dataList = applicantMgmtService.selectApplyList(pagingVO);
		pagingVO.setDataList(dataList);
		
		List<RecruitmentNoticeVO> recNtcList = applicantMgmtService.getRecNtcList(corpId);			
		
		// 오늘 날짜 String화
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); 

        // 공고 상태 set해주기
        for (RecruitmentNoticeVO notice : recNtcList) {
            // 여기서 공고마감, 공고전 , D-day 표시하기
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String endDate = notice.getRecNtcEnd();
            String startDate = notice.getRecNtcStart();
            String today = todayString;
            try {
				Date endDateDate = dateFormat.parse(endDate);
				Date startDateDate = dateFormat.parse(startDate);
            	Date todayDate = dateFormat.parse(today);
				
            	if (todayDate.before(startDateDate)) {
            	    notice.setStatus("공고대기중");
            	} else if (todayDate.after(endDateDate)) {
            	    notice.setStatus("공고마감");
            	} else {
            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
            		int lastDay = (int)diffDay;
            		notice.setStatus("D-" + lastDay);
            	}
            	
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
		
        Map<String, Object> response = new HashMap<>();
        response.put("pagingVO", pagingVO);
        response.put("recNtcList", recNtcList);
		 
		return new ResponseEntity<>(response, HttpStatus.OK);
	}	
	
	
	@RequestMapping(value="/resume", method=RequestMethod.GET)
	public String resume(@RequestParam("resumeNo") int resumeNo, Model model) {
		
		log.info("resume() 실행...!");
		log.info("받아온 resumeNo >> " + resumeNo);
		ResumeVO basicResumeVO = applicantMgmtService.basicResume(resumeNo);
		List<CertificationVO> certificationVO = applicantMgmtService.certificationForResume(resumeNo);
		List<ResumeSkillVO> resumeSkillVO = applicantMgmtService.skillForResume(resumeNo);
		List<ResumeCareerVO> resumeCareerVO = applicantMgmtService.careerForResume(resumeNo);
		
		log.info("basicResumeVO 값 체크 >> " + basicResumeVO);
		log.info("certificationVO 값 체크 >> " + certificationVO);
		log.info("resumeSkillVO 값 체크 >> " + resumeSkillVO);
		log.info("resumeCareerVO 값 체크 >> " + resumeCareerVO);
		
		model.addAttribute("basicResumeVO", basicResumeVO);
		model.addAttribute("certificationVO", certificationVO);
		model.addAttribute("resumeSkillVO", resumeSkillVO);
		model.addAttribute("resumeCareerVO", resumeCareerVO);
		
		return "recruiter/resume";
	}
	
	@ResponseBody
	@RequestMapping(value="/selfInfoAnswer", method=RequestMethod.GET)
	public ResponseEntity<?> selfInfoAnswer(@RequestParam("applyNo") int applyNo, Model model) {
		log.info("selfInfoAnswer() 실행...!");
		List<AnswerSelfIntroVO> answerSelfIntroList = applicantMgmtService.selfInfoAnswer(applyNo);
        Map<String, Object> response = new HashMap<>();
        response.put("answerSelfIntroList", answerSelfIntroList);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/codingTestAnswer", method=RequestMethod.GET)
	public ResponseEntity<?> codingTestAnswer(
			@RequestParam("applyNo") int applyNo, 
			Model model){
		log.info("codingTestAnswer() 실행...!");
		List<AnswerCodingTestVO> answerCodingTestList = applicantMgmtService.codingTestAnswer(applyNo);
		log.info("answerCodingTestList -> " + answerCodingTestList);
		Map<String, Object> response = new HashMap<>();
		response.put("answerCodingTestList", answerCodingTestList);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/pass", method=RequestMethod.POST)
	public ResponseEntity<ServiceResult> pass(
			@RequestBody ApplyVO applyVO
			//RedirectAttributes ra
			){
		log.info("pass() 실행...!");
		//String curAppStatusCode = map.get("applicantStatusCode");
		
		int applyNo = applyVO.getApplyNo();
		log.info("applyNo ==========================================="+applyNo);
		
		// alarm insert하기
		String memId = applicantMgmtService.getMemid(applyNo);
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setMemId(memId);
		String status = applicantMgmtService.getStatus(applyNo);
		alarmVO.setStatus(status);
		alarmVO.setAlarmYn("N");
		alarmVO.setApplyNo(applyNo);
		applicantMgmtService.insertAlarm(alarmVO);
		
		// update 해주기
		ServiceResult result = applicantMgmtService.updateApplicantStatus(applyNo);
//		if(result.equals(ServiceResult.OK)) {
//			ra.addFlashAttribute("message", "합격처리 되었습니다.");
//		}else {
//			ra.addFlashAttribute("message", "다시 시도해주세요");
//		}
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/nonPass", method=RequestMethod.POST)
	public ResponseEntity<ServiceResult> nonPass(
			@RequestBody ApplyVO applyVO
			//RedirectAttributes ra
			){
		log.info("nonPass() 실행...!");
		
		int applyNo = applyVO.getApplyNo();
		
		// alarm insert하기
		String memId = applicantMgmtService.getMemid(applyNo);
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setMemId(memId);
		alarmVO.setAlarmYn("N");
		alarmVO.setApplyNo(applyNo);
		
		// update 해주기
		ServiceResult result = applicantMgmtService.updateApplicantNonPass(applyNo);
		String status = applicantMgmtService.getStatus(applyNo);
		alarmVO.setStatus(status);
		applicantMgmtService.insertAlarm(alarmVO);
//		if(result.equals(ServiceResult.OK)) {
//			ra.addFlashAttribute("message", "불합격 처리 되었습니다.");
//		}else {
//			ra.addFlashAttribute("message", "다시 시도해주세요");
//		}
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}

	
}





