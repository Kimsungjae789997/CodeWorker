package kr.or.ddit.controller.recruiter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IRecruitmentMgmtService;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSkillStackVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/recruitmentmanage")
public class RecruitmentMgmtController {

	@Inject
	private IRecruitmentMgmtService recruitementMgmtService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String RecruitInsertForm(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "recNtcTitle") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		log.info("RecruitInsertForm()실행============" + currentPage);
		CustomUser user = 
				(CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = user.getMember();
		if(memberVO != null) {	// 회원인 경우  
			//  기업회원id로 기업 id가져오기
			String crpId = recruitementMgmtService.selectCrpId(memberVO.getMemId());
			
			PaginationInfoVO<RecruitmentNoticeVO> pagingVO = new PaginationInfoVO<RecruitmentNoticeVO>(10,5);
			pagingVO.setCrpId(crpId); // 페이징VO에 기업id 넣기
			
			// 검색 기능 추가
			// 검색 기능 추가
			if(StringUtils.isNotBlank(searchWord)) {
				pagingVO.setSearchType(searchType);
				pagingVO.setSearchWord(searchWord);
				
				// 검색 후, 목록 페이지로 이동 할 때 검색된 내용을 적용시키기 위한 데이터 전달
				model.addAttribute("searchType", searchType);
				model.addAttribute("searchWord", searchWord);
			}
			pagingVO.setCurrentPage(currentPage);
			
			
			int totalRecord = recruitementMgmtService.selectRecruitmentCount(pagingVO);
			pagingVO.setTotalRecord(totalRecord);
					
			List<RecruitmentNoticeVO> dataList = recruitementMgmtService.selectRecruitmentAllSelect(pagingVO);
	        
			// 오늘 날짜 String화
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        LocalDate now = LocalDate.now();
	        String todayString = now.format(formatter); 
			
			
			// 각 공고에 대해 지원자 수 가져오기
	        for (RecruitmentNoticeVO notice : dataList) {
	            int applicantCount = recruitementMgmtService.selectApplicantCount(notice.getRecNtcId());
	            notice.setApplicant(applicantCount);
	            // 여기서 공고마감, 공고전 , D-day 표시하기
	            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            // 공고마감날
	            String endDate = notice.getRecNtcEnd();
	            // 공고시작날
	            String startDate = notice.getRecNtcStart();
	            // 현재시간
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
			model.addAttribute("pagingVO", pagingVO);
			
		}
		
		return "corp/recruiter/recruitmentMgmt";
	}
	
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String recruitmentDetail(RecruitmentNoticeVO recruitmentVO, Model model) {
	    String recNtcId = recruitmentVO.getRecNtcId(); // 개개인의 공고 id 가져옴
	    RecruitmentNoticeVO recVO = recruitementMgmtService.recruitmentDetail(recNtcId);
	    log.info("recruitmentDetail() 실행 ================================");
	    model.addAttribute("recVO", recVO);
	    
	    // 기술스택 담는곳
	    List<RecruitmentSkillStackVO> skillVO = recruitementMgmtService.selectSkillStack(recNtcId);
	    
	    
	    CorporationVO corVO = recruitementMgmtService.selectCorporation(recVO.getCrpId());
	    
	    String skill = "";
	    for (int i = 0; i < skillVO.size(); i++) {
	        skill += skillVO.get(i).getSkillstackCode();
	        if (i < skillVO.size() - 1) {
	            skill += ", ";
	        }
	    }
	    
	    model.addAttribute("skill", skill);
	    model.addAttribute("corVO", corVO);
	    return "corp/recruiter/recruitmentDetail";    
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String recruitmentDelete(RecruitmentNoticeVO recVo, Model model) {
			recruitementMgmtService.recruitmentDelete(recVo.getRecNtcId());

			
			return "corp/recruiter/recruitmentMgmt";

	}
}
