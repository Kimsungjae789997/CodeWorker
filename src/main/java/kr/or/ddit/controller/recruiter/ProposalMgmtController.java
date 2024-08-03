package kr.or.ddit.controller.recruiter;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IApplicantMgmtService;
import kr.or.ddit.service.IMyCorpMgmtService;
import kr.or.ddit.service.IProposalService;
import kr.or.ddit.service.IRecruitmentMgmtService;
import kr.or.ddit.service.IRecruitmentNoticeService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ProposalVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/proposal")
public class ProposalMgmtController {
	
	@Inject
	private IProposalService proposalService;
	
	@Inject
	private IRecruitmentNoticeService recruitmentNoticeService;
	
	@Inject
	private IRecruitmentMgmtService recruitementMgmtService;
	
	@Inject
	private IApplicantMgmtService applicantMgmtService;
	
	@Autowired
	private IMyCorpMgmtService myCorpMgmtService;
	
	@RequestMapping(value="/searchMain", method = RequestMethod.GET)
	public String proposalMain(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name="searchWord", required = false) String searchWord,
			@RequestParam(name="seekerExp", required = false) String seekerExp,
			@RequestParam(name="seekerExpYearsCode", required = false) String seekerExpYearsCode,
			@RequestParam(name="seekerAdd1", required = false) String seekerAdd1,
			@RequestParam(name="eduTypeCode", required = false) String eduTypeCode,
			@RequestParam(name="skillstackCode", required = false) String skillstackCode,
			Principal principal,
			Model model
			) {
		log.info("proposalMain() 실행...!");
		
		if(principal==null) {
			return "redirect:/login";
		}

		// 제안 가능한 인재 목록 가져오기
		PaginationInfoVO<SeekerVO> pagingVO = new PaginationInfoVO<SeekerVO>(5,5);
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
		}
		
		// 필터 0 : 경력 여부 
		if(StringUtils.isNotBlank(seekerExp)) {
			if (seekerExp.equals("EXP0101")) {
				pagingVO.setSeekerExp("신입");
			}else if (seekerExp.equals("EXP0102")){
				pagingVO.setSeekerExp("경력");
			}else if (seekerExp.equals("EXP0103")){ // 학력 무관일 경우
				pagingVO.setSeekerExp("");
			}
		}
		
		// 필터 1 : 경력 연차
		if(StringUtils.isNotBlank(seekerExpYearsCode)) {
			pagingVO.setSeekerExpYearsCode(seekerExpYearsCode);
		}
		// 필터 2 : 지역
		if(StringUtils.isNotBlank(seekerAdd1)) {
			pagingVO.setSeekerAdd1(seekerAdd1);
		}
		// 필터 3 : 학력
		if(StringUtils.isNotBlank(eduTypeCode)) {
			if(eduTypeCode.equals("EDU0101")) {
				pagingVO.setEduTypeCode("");
			}else {
				pagingVO.setEduTypeCode(eduTypeCode);
			}
		}
		// 필터 4 : 보유기술
		if(StringUtils.isNotBlank(skillstackCode)) {
			pagingVO.setSkillstackCode(skillstackCode);
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = proposalService.totalSeekerListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		log.info("pagingVo ==> {}", pagingVO);
		// 보유 기술 & 총 경력년수
		List<SeekerVO> totalSeekerList = proposalService.totalSeekerListForProposal(pagingVO);
		for(int i = 0; i < totalSeekerList.size(); i++) {
			SeekerVO seekerVO2 = totalSeekerList.get(i);
			
			List<ResumeSkillVO> resumeSkillList = proposalService.selectSkillList(seekerVO2.getResumeVO().getResumeNo());
			if(resumeSkillList != null && resumeSkillList.size() > 0) {
				totalSeekerList.get(i).setResumeSkillList(resumeSkillList);
			}
			String careerTotalDuration = proposalService.careerTotalDuration(seekerVO2.getResumeVO().getResumeNo());
			if(careerTotalDuration != null) {
				totalSeekerList.get(i).setCareerTotalDuration(careerTotalDuration);
			}
		}
		
		pagingVO.setDataList(totalSeekerList);
		model.addAttribute("pagingVO", pagingVO);
		
		// ----------------------------------------------------------------------
		// 필터를 위한 조건 데이터
		// 지역 리스트 가져오기
		List<Map<String, Object>> locationList = proposalService.getLocations();
		model.addAttribute("locationList", locationList);
		
		// 보유기술 리스트 가져오기
		List<Map<String, Object>> skillList = proposalService.getSkills();
		model.addAttribute("skillList", skillList);
		
		// 경력여부 리스트 가져오기
		List<Map<String, Object>> hasCareerList = proposalService.getHasCareer(); 
		model.addAttribute("hasCareerList", hasCareerList);
		
		// 경력 연차 리스트 가져오기
		List<Map<String, Object>> careerYearsList = proposalService.getCareerYears();
		model.addAttribute("careerYearsList", careerYearsList);
		
		// 학력 리스트 가져오기
		List<Map<String, Object>> educationList = proposalService.getEducation();
		model.addAttribute("educationList", educationList);
		
		
		return "corp/recruiter/proposalForSearch";
	}
	
	
	/**
	 * 모달창 공고목록
	 * 
	 * @param currentPage
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="/recNtcList", method=RequestMethod.GET)
	public ResponseEntity<List<RecruitmentNoticeVO>> recNtcListForProposal(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Principal principal
			){
		log.info("recNtcListForProposal() 실행...! ");
		String memId = principal.getName();
		log.info("recNtcListForProposal->memId : " + memId);
		PaginationInfoVO<RecruitmentNoticeVO> pagingVO = new PaginationInfoVO<RecruitmentNoticeVO>();
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setMemId(memId);
		
		String crpId = myCorpMgmtService.getCrpIdByMemId(memId);
		pagingVO.setCrpId(crpId);

		int totalRecord = recruitmentNoticeService.selectRecNtcCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<RecruitmentNoticeVO> dataList = recruitmentNoticeService.selectRecNtcList(pagingVO);
		log.info("recNtcListForProposal->dataList : " + dataList);
		// 오늘 날짜 String화
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); 
		
        for (RecruitmentNoticeVO notice : dataList) {
            // 공고 별 지원자 수 가져오기
        	int applicantCount = recruitementMgmtService.selectApplicantCount(notice.getRecNtcId());
            notice.setApplicant(applicantCount);

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
		pagingVO.setDataList(dataList);		
//		Map<String, Object> response = new HashMap<>();
//		response.put("pagingVO", pagingVO);
		
		return new ResponseEntity<List<RecruitmentNoticeVO>>(dataList, HttpStatus.OK);
	}
	
	/**
	 * 제안하기 버튼 클릭 -> 제안 테이블에 insert
	 * 
	 * @param map
	 * @param principal
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> insertProposal(
				@RequestBody Map<String, String> map,
				Principal principal
			){
		
		String recruiterId = principal.getName();
		String crpId = recruitementMgmtService.selectCrpId(recruiterId);
		String seekerId = map.get("memId");
		String recNtcId = map.get("recNtcId");
		ProposalVO proposalVO = new ProposalVO();

		proposalVO.setRecuriterId(recruiterId);
		proposalVO.setCrpId(crpId);
		proposalVO.setMemId(seekerId);
		proposalVO.setRecNtcId(recNtcId);
		
		Map<String, Object> response = new HashMap<>();
		ServiceResult result = proposalService.insertProposal(proposalVO);
		int proNo = proposalVO.getProNo();
		log.info("proNo : ===============================================================" + proNo);
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setMemId(seekerId);
		alarmVO.setProNo(proNo);
		alarmVO.setStatus("PROPOSAL");
		alarmVO.setAlarmYn("N");
		applicantMgmtService.insertAlarm(alarmVO);
		response.put("proNo", proNo);
		
		if(result.equals(ServiceResult.OK)) {
			// 보낼 데이터 담아서 ...
			// response.put();
			
			return new ResponseEntity<>(response, HttpStatus.OK); 
		}else { // 제안하기 실패
			return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
		}
		
	}
	
	

}
