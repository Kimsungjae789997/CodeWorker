package kr.or.ddit.controller.seeker;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ISeekerMainService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.InterestCorporationVO;
import kr.or.ddit.vo.InterestRecNtcVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/crp")
public class CrpMainRetrieveController {

	@Inject
	private ISeekerMainService seekerMainService;
	
	@Scheduled(fixedDelay = 1000) 
	@RequestMapping(value = "/recruitmentAllSelect", method = RequestMethod.POST)
	public ResponseEntity<List<RecruitmentNoticeVO>> recruitmentAllSelect(@RequestBody RecruitmentNoticeVO recVO){
		
		List<RecruitmentNoticeVO> recList = seekerMainService.recruitmentAllSelect(recVO.getCrpId());
		
		// 채용공고 수 가져오기
		int recNtcCount = seekerMainService.recruitmentCount(recVO.getCrpId());
		
		// 오늘 날짜 String화
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); 
        
        // 각각 채용마감인거와 d-day표시
		for(RecruitmentNoticeVO vo : recList) {
			// 채용공고수 넣기
			vo.setRecNtcCount(recNtcCount);
			
            // 여기서 공고마감, D-day 표시하기
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            // 공고마감날
            String endDate = vo.getRecNtcEnd();
            // 현재시간
            String today = todayString;
            
            try {
				Date endDateDate = dateFormat.parse(endDate);
            	Date todayDate = dateFormat.parse(today);
            	if(todayDate.after(endDateDate)) {
            		vo.setStatus("공고마감");
            	}
            	else {
            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
            		int lastDay = (int)diffDay;
            		vo.setStatus("D-" + lastDay);
            	}
            	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
        
		return new ResponseEntity<List<RecruitmentNoticeVO>>(recList,HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/interestCrpSelect.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> interestCrpSelect(
			@RequestBody InterestCorporationVO corVO, Model model
			){
		log.info("interestCrpSelect() ===== 실행 ");
		Map<String, Object> map = new HashMap<String,Object>();
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if(principal instanceof CustomUser) {
	        CustomUser user = (CustomUser) principal;
	        MemberVO memberVO = user.getMember();
		    corVO.setMemId(memberVO.getMemId());
	        if(memberVO != null) {
	        	int count = seekerMainService.selectInterestCrpCount(corVO);
	        	map.put("count", count);
	        	InterestCorporationVO intrestCorporationVO = seekerMainService.interestCrpSelect(corVO);
				if(intrestCorporationVO != null) {	// 관심회사 등록 되어있음
					map.put("result", ServiceResult.EXIST);

				}else {	// 내가 관심회사 등록 안함
					map.put("result", ServiceResult.FAILED);
				}
	        }
    	}else { // 비회원
    		map.put("result", ServiceResult.FAILED);
    	}  	
    
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/interestCrp.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> interestCrp(
			@RequestBody InterestCorporationVO corVO, Model model
			){
		
		Map<String, Object> map = new HashMap<String,Object>();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	 
		 if(principal instanceof CustomUser) {
		        CustomUser user = (CustomUser) principal;
		        MemberVO memberVO = user.getMember();
		        corVO.setMemId(memberVO.getMemId());
		        if(memberVO != null) { // 일반회원
		        	// 관심회사 등록하기
		        	seekerMainService.interestCrp(corVO);
		        	map.put("result", ServiceResult.EXIST);
		        }
		 }else {	// 비회원
			 map.put("result", ServiceResult.FAILED);
		 }
		
		return new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
	}
	
	
}
