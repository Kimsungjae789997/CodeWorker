package kr.or.ddit.controller.seeker;



import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ISeekerMainService;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.InterestRecNtcVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainRetrieveController {

	@Inject
	private ISeekerMainService seekerMainService;
	

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String mainList(Model model) {
	    log.info("mainList() 실행...! ");
	    List<RecruitmentNoticeVO> recruitmentNoticeList = null;
	    // SecurityContextHolder에서 현재 인증된 사용자 정보 가져오기
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    
	    log.info("Principal 객체 타입: " + principal.getClass().getName());
	    
	    // principal이 CustomUser 타입인지 확인
	    if (principal instanceof CustomUser) {
	        CustomUser user = (CustomUser) principal;
	        MemberVO memberVO = user.getMember();
	        
	        if (memberVO != null) { // 일반회원
	        	// 최신 공고 가져오기 (공통)
	            recruitmentNoticeList = seekerMainService.recentRecruitmentSelect();
		       
	            // 자신의 지역 공고 (회원)
	            List<RecruitmentNoticeVO> recruitmentNoticeList2 = seekerMainService.locationRecruitmentSelect(memberVO.getMemId());
	            
	            // 지역명 가져오기
	            String location = seekerMainService.locationSelect(memberVO.getMemId());
	            
	            // 최근 본 순 가져오기
	            List<RecruitmentNoticeVO> recruitmentNoticeList3 = seekerMainService.recViewSelect(memberVO.getMemId());
	            
	            //d -day 계산
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        LocalDate now = LocalDate.now();
		        String todayString = now.format(formatter); // 오늘 날짜 String화
		       
		        //1
		        for(RecruitmentNoticeVO recruit : recruitmentNoticeList) {
		            // 끝나는 날 - 오늘의 날짜 == 구하고자 하는 남은날짜
		            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		            
		            String endDate = recruit.getRecNtcEnd();
		            String today = todayString;
		            
		            try {
		                Date endDateDate = dateFormat.parse(endDate);
		                Date todayDate = dateFormat.parse(today);
		                
		            	if(todayDate.after(endDateDate)) {
		            		recruit.setStatus("공고마감");
		            	}
		            	else {
		            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
		            		int lastDay = (int)diffDay;
		            		recruit.setStatus("D-" + lastDay);
		            	}
		            	   log.info("Recruit ID:====================== " + recruit.getRecNtcId() + ", Status: " + recruit.getStatus());
					} catch (Exception e) {
						e.printStackTrace();
					}
		        }
		        
		        //2
		        for(RecruitmentNoticeVO recruit2 : recruitmentNoticeList2) {
		            // 끝나는 날 - 오늘의 날짜 == 구하고자 하는 남은날짜
		            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		            
		            String endDate = recruit2.getRecNtcEnd();
		            String today = todayString;
		            
		            try {
		                Date endDateDate = dateFormat.parse(endDate);
		                Date todayDate = dateFormat.parse(today);
		                
		            	if(todayDate.after(endDateDate)) {
		            		recruit2.setStatus("공고마감");
		            	}
		            	else {
		            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
		            		int lastDay = (int)diffDay;
		            		recruit2.setStatus("D-" + lastDay);
		            	}
		            	   log.info("Recruit ID:-------------- " + recruit2.getRecNtcId() + ", Status: " + recruit2.getStatus());
					} catch (Exception e) {
						e.printStackTrace();
					}
		        }
	            
		        //3
		        for(RecruitmentNoticeVO recruit3 : recruitmentNoticeList3) {
		        	 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			            
			            String endDate = recruit3.getRecNtcEnd();
			            String today = todayString;
			            
			            try {
			                Date endDateDate = dateFormat.parse(endDate);
			                Date todayDate = dateFormat.parse(today);
			                
			            	if(todayDate.after(endDateDate)) {
			            		recruit3.setStatus("공고마감");
			            	}
			            	else {
			            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
			            		int lastDay = (int)diffDay;
			            		recruit3.setStatus("D-" + lastDay);
			            	}
			            	   log.info("Recruit ID:-------------- " + recruit3.getRecNtcId() + ", Status: " + recruit3.getStatus());
						} catch (Exception e) {
							e.printStackTrace();
						}
		        }
		        
		        
	            model.addAttribute("recruitmentNoticeList", recruitmentNoticeList);
	            model.addAttribute("recruitmentNoticeList2", recruitmentNoticeList2);
	            model.addAttribute("recruitmentNoticeList3", recruitmentNoticeList3);
	            model.addAttribute("location", location);

	        }
	    } else { // 비회원
	        // 최신 공고 가져오기 (공통)
	         recruitmentNoticeList = seekerMainService.recentRecruitmentSelect();
	        
	        //d -day 계산
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        LocalDate now = LocalDate.now();
	        String todayString = now.format(formatter); // 오늘 날짜 String화
	       
	        for(RecruitmentNoticeVO recruit : recruitmentNoticeList) {
	            // 끝나는 날 - 오늘의 날짜 == 구하고자 하는 남은날짜
	            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            
	            String endDate = recruit.getRecNtcEnd();
	            String today = todayString;
	            
	            try {
	                Date endDateDate = dateFormat.parse(endDate);
	                Date todayDate = dateFormat.parse(today);
	                
	            	if(todayDate.after(endDateDate)) {
	            		recruit.setStatus("공고마감");
	            	}
	            	else {
	            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
	            		int lastDay = (int)diffDay;
	            		recruit.setStatus("D-" + lastDay);
	            	}
	            	
	            	
	    	        
	            	log.info("Recruit ID:====================== " + recruit.getRecNtcId() + ", Status: " + recruit.getStatus());
				} catch (Exception e) {
					e.printStackTrace();
				}
	        }
	        

	        
	        model.addAttribute("recruitmentNoticeList", recruitmentNoticeList);
	    }
	    

	    return "seeker/main"; 
	}
	

    
    @ResponseBody
    @RequestMapping(value = "/autoComplete", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<List<CorporationVO>> autoComplete(){
    	List<CorporationVO> list = seekerMainService.autoComplete();
    	
		return new ResponseEntity<List<CorporationVO>>(list,HttpStatus.OK);
    	
    }
    
    @RequestMapping(value = "/profileSearch", method = RequestMethod.POST)
    public ResponseEntity<String> profileSearch(@RequestBody SeekerVO seekerVO) {
    	return new ResponseEntity<String>(seekerMainService.profileSearch(seekerVO.getMemId()), HttpStatus.OK);
    }
    
    // 북마크 select하기
    @RequestMapping(value = "/bookmarkSelect.do", method = RequestMethod.POST)
    public ResponseEntity<ServiceResult> bookmarkSelect(
    		@RequestBody InterestRecNtcVO recntcVO, Model model
    		){
    	log.info("bookmarkSelect()실행=================");
    	ServiceResult result = null;
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if(principal instanceof CustomUser) {
	        CustomUser user = (CustomUser) principal;
	        MemberVO memberVO = user.getMember();
	        recntcVO.setMemId(memberVO.getMemId());
	        if(memberVO != null) {
	        	InterestRecNtcVO recVO = seekerMainService.bookmarkSelect(recntcVO);
	        	if(recVO != null) {	// 북마크 있음
	        		result = ServiceResult.EXIST;
	        	}else {	//북마크 없던거
	        		result = ServiceResult.FAILED;
	        	}
	        }
    	}else { // 비회원
    		result = ServiceResult.FAILED;
    	}
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
    }
    
    // 북마크 하기
    @RequestMapping(value = "/bookmark.do", method = RequestMethod.POST)
    public ResponseEntity<ServiceResult> booMark(@RequestBody InterestRecNtcVO recntcVO, Model model) {
		 log.info("booMark() 실행 =========================");
		 log.info("recNtcId : ============" +recntcVO);
    	 ServiceResult result = null;
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	 
		 if(principal instanceof CustomUser) {
		        CustomUser user = (CustomUser) principal;
		        MemberVO memberVO = user.getMember();
		        recntcVO.setMemId(memberVO.getMemId());
		        if(memberVO != null) { // 일반회원
		        	seekerMainService.bookmarkInsert(recntcVO);
		        	result = ServiceResult.EXIST;
		        }
		 }else {	// 비회원
			 result = ServiceResult.FAILED;
		 }
    	 
		 
    	 
    	return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
    };
    
    
    @RequestMapping(value = "/crpDetail", method = RequestMethod.GET)
    public String crpDetail(CorporationVO corVO , Model model) {
    	log.info("crpDetail()=================== 실행");
    	// 기업정보 가져오기
    	CorporationVO corporationVO = seekerMainService.crpSelect(corVO.getCrpId());
    	model.addAttribute("corporationVO", corporationVO);
    	
		return "seeker/crpMain";
    }
    
    @RequestMapping(value = "/addRecentView", method = RequestMethod.POST)
    public ResponseEntity<ServiceResult> addRecentView(@RequestBody Map<String, Object> request) {
    	Map<String, Object> map = new HashMap<String, Object>();
        String recNtcId = (String) request.get("recNtcId");
        map.put("recNtcId", recNtcId);
        log.info("recNtcId==========================================================================" + recNtcId);
        ServiceResult result = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	 
		 if(principal instanceof CustomUser) {
		        CustomUser user = (CustomUser) principal;
		        MemberVO memberVO = user.getMember();
		        if(memberVO != null) { // 일반회원
		        	map.put("memId", memberVO.getMemId());
		        	log.info("memId==========================================================================" + memberVO.getMemId());
		        	    
		        }
		 }else {	// 비회원
			 result = ServiceResult.FAILED;
		 }
		 result = seekerMainService.addRecentView(map);
        return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
    }
    
    // 자신의 지역 공고 
    @RequestMapping(value = "/locationAllSelect", method = RequestMethod.GET)
    public String locationAllSelect(Model model, Principal principal) {
    	String memId = principal.getName();
    	log.info("memId :" + memId);
    	
        // 자신의 지역 공고 (회원)
        List<RecruitmentNoticeVO> recruitmentNoticeList2 = seekerMainService.locationRecruitmentSelect(memId);
        
        // 지역명 가져오기
        String location = seekerMainService.locationSelect(memId);
        
        //d -day 계산
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); // 오늘 날짜 String화
        
        //2
        for(RecruitmentNoticeVO recruit2 : recruitmentNoticeList2) {
            // 끝나는 날 - 오늘의 날짜 == 구하고자 하는 남은날짜
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            String endDate = recruit2.getRecNtcEnd();
            String today = todayString;
            
            try {
                Date endDateDate = dateFormat.parse(endDate);
                Date todayDate = dateFormat.parse(today);
                
            	if(todayDate.after(endDateDate)) {
            		recruit2.setStatus("공고마감");
            	}
            	else {
            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
            		int lastDay = (int)diffDay;
            		recruit2.setStatus("D-" + lastDay);
            	}
            	   log.info("Recruit ID:-------------- " + recruit2.getRecNtcId() + ", Status: " + recruit2.getStatus());
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        
        model.addAttribute("location", location);
        model.addAttribute("recruitmentNoticeList2", recruitmentNoticeList2);
    	
    	return "seeker/locationAll";
    }
    
    // 최근 본 공고 - 전체보기
    @PreAuthorize("hasRole('ROLE_SEEKER')")
    @RequestMapping(value = "/recViewAllSelect", method = RequestMethod.GET)
    public String recViewAllSelect(Model model, Principal principal) {
	
    	String memId = principal.getName();
    	log.info("memId :" + memId);
        // 최근 본 순 가져오기
        List<RecruitmentNoticeVO> recruitmentNoticeList3 = seekerMainService.recViewSelect(memId);
        
        //d -day 계산
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); // 오늘 날짜 String화
        
        //3
        for(RecruitmentNoticeVO recruit3 : recruitmentNoticeList3) {
        	 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            
	            String endDate = recruit3.getRecNtcEnd();
	            String today = todayString;
	            
	            try {
	                Date endDateDate = dateFormat.parse(endDate);
	                Date todayDate = dateFormat.parse(today);
	                
	            	if(todayDate.after(endDateDate)) {
	            		recruit3.setStatus("공고마감");
	            	}
	            	else {
	            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
	            		int lastDay = (int)diffDay;
	            		recruit3.setStatus("D-" + lastDay);
	            	}
	            	   log.info("Recruit ID:-------------- " + recruit3.getRecNtcId() + ", Status: " + recruit3.getStatus());
				} catch (Exception e) {
					e.printStackTrace();
				}
        }
        
        model.addAttribute("recruitmentNoticeList3", recruitmentNoticeList3);
        
    	return "seeker/recViewAll";
    }
    
    
   
}
