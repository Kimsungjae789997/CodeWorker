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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IMyCorpMgmtService;
import kr.or.ddit.service.IProposalService;
import kr.or.ddit.service.IRecruitmentMgmtService;
import kr.or.ddit.service.IRecruitmentNoticeService;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ProposalVO;
import kr.or.ddit.vo.RecruiterVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruiter")
public class RecruiterMainController {
		
	@Inject
	private IRecruitmentNoticeService recruitmentNoticeService;

	@Inject
	private IProposalService proposalService;
	
	@Inject
	private IRecruitmentMgmtService recruitementMgmtService;
	
	@RequestMapping(value="/resume", method=RequestMethod.GET)
	public String resume() {
		return  "recruiter/resumeTemplate";
	}
	
	
	@PreAuthorize("hasRole('ROLE_RECRUITER')")
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPageA,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPageB,
			Model model,
			Principal principal
			) {
		log.info("main page () 실행...! ");
		
		if(principal==null) {
			return "redirect:/login";
		}
		String memId = principal.getName();
		log.info("main page -> memId : " + memId);
		
		// 진행중인 채용 목록
		PaginationInfoVO<RecruitmentNoticeVO> pagingVOA = new PaginationInfoVO<RecruitmentNoticeVO>();
		pagingVOA.setCurrentPage(currentPageA);
		pagingVOA.setMemId(memId);
		String crpId = recruitementMgmtService.selectCrpId(memId);
		pagingVOA.setCrpId(crpId); 
		
		int totalRecordA = recruitmentNoticeService.selectRecNtcCount(pagingVOA);
		pagingVOA.setTotalRecord(totalRecordA);
		List<RecruitmentNoticeVO> dataListA = recruitmentNoticeService.selectRecNtcList(pagingVOA);
		
		// 오늘 날짜 String화
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); 
		
        for (RecruitmentNoticeVO notice : dataListA) {
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
		
		pagingVOA.setDataList(dataListA);		
		model.addAttribute("pagingVOA", pagingVOA);
		
		// 제안한 인재 목록		
		PaginationInfoVO<ProposalVO> pagingVOB = new PaginationInfoVO<ProposalVO>();
		pagingVOB.setCurrentPage(currentPageB);
		pagingVOB.setMemId(memId);
		
		int totalRecordB = proposalService.selectProposalCount(pagingVOB);
		pagingVOB.setTotalRecord(totalRecordB);
		List<ProposalVO> dataListB = proposalService.selectProposalList(pagingVOB);
		
		log.info("dataListB >> " + dataListB);
		pagingVOB.setDataList(dataListB);
		model.addAttribute("pagingVOB", pagingVOB);
		
		return "corp/recruiter/recruiterMain";
	}
	
}
