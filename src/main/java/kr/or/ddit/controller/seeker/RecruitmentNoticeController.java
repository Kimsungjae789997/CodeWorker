package kr.or.ddit.controller.seeker;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IRecruitmentNoticeService;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.DetailCodeVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSelfIntroVO;
import kr.or.ddit.vo.RecruitmentSkillStackVO;
import kr.or.ddit.vo.SeekerVO;
import kr.or.ddit.vo.SelfIntroVO;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.l;

@Controller
@Slf4j
@RequestMapping("/recruitment")
public class RecruitmentNoticeController {
	
	@Inject
	private IRecruitmentNoticeService recruitmentNoticeService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		
        // 최신 공고 가져오기  
        List<RecruitmentNoticeVO> recruitmentNoticeList = recruitmentNoticeService.recentRecruitmentSelect();
        
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
                
                long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
                int lastDay = (int)diffDay;
                if(lastDay < 0) {
                    lastDay = 0; // 잔여일수가 0일 미만이라면 -x 일로 표기되는게 아니라 0일로 표기된다.
                }
                recruit.setLast(lastDay);
                
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        model.addAttribute("recruitmentNoticeList", recruitmentNoticeList);
        
		return "seeker/RecruitmentMain";
	}
	
	// 채용공고 가져오기
	@ResponseBody
	@RequestMapping(value = "/latest", method = RequestMethod.GET)
	public ResponseEntity<List<RecruitmentNoticeVO>> latest(
	         @RequestParam List<String> filters,
	         @RequestParam(value = "sort", defaultValue = "latest") String sort,
	         @RequestParam List<String> locations,
	         @RequestParam List<String> skills,
	         @RequestParam(value = "eduCode" ,defaultValue = "defaultEduCode") String eduCode,
	         @RequestParam (value = "posCode", defaultValue = "defaultPosCode")List<String> posCode
			) {
	    log.info("latest() 실행====== ");
	    log.info("filters : " + filters);
	    log.info("sort : " + sort);
	    log.info("locations : " + locations);
	    log.info("eduCode : " + eduCode);
	    log.info("posCode : " + posCode);
	    Map<String, Object> map = new HashMap<>();
	    
	    // 스킬코드를 가져와서 거기에 rec_ntc_id를 가져와
	    if (skills != null && !skills.isEmpty()) {
	        map.put("skills", skills);
	        List<String> recNtcIdList = recruitmentNoticeService.getRecNtcId(map);
	        
	        if (recNtcIdList == null || recNtcIdList.isEmpty()) {
	            // recNtcIdList가 빈 경우, 빈 리스트를 반환하거나 필요에 따라 다른 처리를 합니다.
	            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.OK);
	        }
	        
	        log.info("recNtcId ====================== " + recNtcIdList);
	        map.put("recNtcIdList", recNtcIdList);
	    }
	    
	    map.put("filters", filters);
	    map.put("sort", sort);
	    map.put("locations", locations);
	    map.put("eduCode", eduCode);
	    map.put("posCode", posCode);
	    List<RecruitmentNoticeVO> recListView = recruitmentNoticeService.views(map);
	    
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate now = LocalDate.now();
        String todayString = now.format(formatter); 
        
		for(RecruitmentNoticeVO vo : recListView) {
			
            // 여기서 공고마감, D-day 표시하기
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            // 공고마감날
            String endDate = vo.getRecNtcEnd();
            // 현재시간
            String today = todayString;
            
            try {
				Date endDateDate = dateFormat.parse(endDate);
            	Date todayDate = dateFormat.parse(today);

            		long diffDay = (endDateDate.getTime() - todayDate.getTime()) / (24*60*60*1000);
            		int lastDay = (int)diffDay;
            		vo.setStatus("D-" + lastDay);

            	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	    
	    return new ResponseEntity<>(recListView, HttpStatus.OK);
	}
	
	
    @ResponseBody
    @RequestMapping(value = "/autoComplete", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<List<DetailCodeVO>> autoComplete(){
    	List<DetailCodeVO> list = recruitmentNoticeService.autoComplete();
    	log.info("list =====================" + list);
		return new ResponseEntity<List<DetailCodeVO>>(list,HttpStatus.OK);
    	
    }
	
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String recruitmentNoticeDetail(Model model, RecruitmentNoticeVO recruitmentNoticeVO) {
		log.info("recruitmentNoticeDetail() 실행 ==================");
		// 각각의 공고들 정보들 가져오기
		RecruitmentNoticeVO reruitmentVO = recruitmentNoticeService.recruitmentNoticeDetail(recruitmentNoticeVO.getRecNtcId());
		model.addAttribute("reruitmentVO", reruitmentVO);
		
		List<RecruitmentSkillStackVO> skillVO = recruitmentNoticeService.getSkill(recruitmentNoticeVO.getRecNtcId());
		model.addAttribute("skillVO", skillVO);
		
		return "seeker/recNtcMain";
			
	}
	

	@RequestMapping(value = "/selectSeeker", method = RequestMethod.POST)
	public ResponseEntity<SeekerVO> selectSeeker(@RequestBody SeekerVO seekerVO){
		log.info("memId : " + seekerVO.getMemId());
		SeekerVO VO = null;
		if(seekerVO.getMemId() == null) {

		}else {	// 로그인 경우
			   VO = recruitmentNoticeService.selectSeekerWithResume(seekerVO.getMemId());
			   
		}
		return new ResponseEntity<SeekerVO>(VO,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/selfIntroSelect", method = RequestMethod.POST)
	public ResponseEntity<List<RecruitmentSelfIntroVO>> selfIntroSelect(@RequestBody RecruitmentSelfIntroVO selfIntroVO){
		List<RecruitmentSelfIntroVO> selfIntroList = recruitmentNoticeService.selfIntroSelect(selfIntroVO.getRecNtcId());
		
		return new ResponseEntity<List<RecruitmentSelfIntroVO>>(selfIntroList,HttpStatus.OK);	
	}
	
	@RequestMapping(value = "/applyResume.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> applyResume(@RequestBody ApplyVO applyVO, SelfIntroVO selfVO) {
		log.info("applyResume() 실행==================");
		ServiceResult result = null;	
		result = recruitmentNoticeService.applyResume(applyVO);
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
}
