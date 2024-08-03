package kr.or.ddit.controller.seeker;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IMypageService;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProposalVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
public class MypageRetrieveController {

	@Inject
	private IMypageService mypageService;
	
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mypageMain(Model model, RedirectAttributes ra) {
		
		String goPage = "";
		
		
		CustomUser user = 
				(CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = user.getMember();
		if(memberVO != null) {	// 로그인 사용자
			SeekerVO seekerVO = mypageService.seekerMypageSelect(memberVO.getMemId());
			if(seekerVO != null) {
				model.addAttribute("seekerVO", seekerVO);
				goPage = "seeker/mypageMain";
			}else {
				ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
				goPage = "redirect:/login";
			}
		}else {	// 로그인 하고 와
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			goPage = "redirect:/login";
		}
		return goPage;	
	}
	
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/profile.do", method = RequestMethod.GET)
	public String mypageProfile(Model model) {
		
	      CustomUser user = 
	              (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	        MemberVO memberVO = user.getMember();
		
		
		SeekerVO seekerVO = mypageService.seekerProfileSelect(memberVO.getMemId());
		EducationVO educationVO = mypageService.seekerEduSelect(memberVO.getMemId());
		
		if(educationVO != null) {
			model.addAttribute("educationVO", educationVO);
			model.addAttribute("seekerVO", seekerVO);
		}else {
			model.addAttribute("seekerVO", seekerVO);
		}
		
		return "seeker/mypageProfile";
	}
	
	
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/activity.do", method = RequestMethod.GET)
	public String mypageActivity(String memId, Model model) {
		Map<String, Integer> map = mypageService.allCountSelect(memId); 
		model.addAttribute("map",map);
		model.addAttribute("memId", memId);
		log.info("map========================= : " + map);
		return "seeker/mypageActivity";
	}
	
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/profileUpdate.do", method = RequestMethod.POST)
	public String mypageProfileUpdate(
			HttpServletRequest req, RedirectAttributes ra,
			MemberVO memberVO, Model model) {
		
		SeekerVO seekerVO = memberVO.getSeekerVO();
		log.info("seekerVO.memId : " + seekerVO.getMemId());
		String goPage = "";
		ServiceResult result = mypageService.profileUpdate(req,memberVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "회원정보 수정이 완료되었습니다!");
			goPage = "redirect: /mypage/profile.do?memId="+seekerVO.getMemId();
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("seekerVO", seekerVO);
			goPage = "seeker/mypageProfile";
		}
		return goPage;
	}
	
	
	@RequestMapping(value = "/bookMarkAll", method = RequestMethod.GET)
	public String bookMarkAll(Model model, Principal principal) {
		String memId = principal.getName();
		List<RecruitmentNoticeVO> recruitmentNoticeList =  mypageService.bookMarkAll(memId);
      
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
        
		return "seeker/bookMarkAll";
	}
	
	@RequestMapping(value = "/goInterestCrpAll", method = RequestMethod.GET)
	public String goInterestCrpAll(Model model, Principal principal) {
		String memId = principal.getName();
		List<CorporationVO> corporationList =  mypageService.goInterestCrpAll(memId);
		
		// 관심회사의 채용공고 수
		for(CorporationVO corporationVO : corporationList) {
			String crpId = corporationVO.getCrpId();
			// 각각 관심회사의 채용공고 수
			int recAll = mypageService.getRecCount(crpId);
			
			corporationVO.setRecAll(recAll);
		}
        
        model.addAttribute("corporationList", corporationList);
        
		return "seeker/goInterestCrpAll";
	}
	
	@RequestMapping(value = "/goProposalAll", method = RequestMethod.GET)
	public String goProposalAll(Model model, Principal principal) {
		String memId = principal.getName();
		List<CorporationVO> corporationList = mypageService.goProposalAll(memId);
		
		model.addAttribute("corporationList", corporationList);
		return "seeker/goProposalAll";
	}
	
	@RequestMapping(value = "/proposalAccept", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> proposalAccept(@RequestBody ProposalVO proposalVO){
		ServiceResult result = null;
		int proNo = proposalVO.getProNo();
		result = mypageService.proposalAccept(proNo);
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/proposalDeny", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> proposalDeny(@RequestBody ProposalVO proposalVO){
		ServiceResult result = null;
		int proNo = proposalVO.getProNo();
		result = mypageService.proposalDeny(proNo);
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
}
