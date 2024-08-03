package kr.or.ddit.controller.recruiter;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IMyCorpMgmtService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/corpMgmt")
public class MyCorpMgmtController {
	
	@Inject
	private IMyCorpMgmtService myCorpMgmtService;
		
	@RequestMapping(value="/corpInfo")
	public String myCorp() {
		return "corp/recruiter/myCorporationMgmt";
	}
	
	@RequestMapping(value="/delMember", method=RequestMethod.POST)
	public String deleteMember(
			String memId, Model model, RedirectAttributes ra
			) {
		log.info("들고온 memId >> " + memId);
		String goPage = "";
		ServiceResult result = myCorpMgmtService.deleteMember(memId);
		if(result.equals(ServiceResult.OK)) {
			log.info("삭제 성공...!");
			ra.addFlashAttribute("msg", "mem-del-success");
			goPage = "redirect:/corpMgmt/member";
		}else {
			log.info("삭제 실패...!");
			goPage = "redirect:/corpMgmt/member";
		}
		return goPage;
	}

	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
	public String addMember(
			Model model,
			MemberVO memberVO,
			Principal principal,
			RedirectAttributes ra
			) {
		log.info("addMember() 실행...!");

		String currentUserId = principal.getName();	
		String crpId = myCorpMgmtService.getCrpIdByMemId(currentUserId);
		memberVO.setCrpId(crpId);
		
		String goPage = "";	// 페이지 이동 경로를 담을 공간
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(memberVO.getMemId())) {
			errors.put("memId", "아이디를 입력해주세요!");
		}
		if(StringUtils.isBlank(memberVO.getMemName())) {
			errors.put("memName", "이름을 입력해주세요!");
		}
		if(StringUtils.isBlank(memberVO.getMemPw())) {
			errors.put("memPw", "비밀번호를 입력해주세요!");
		}
		if(errors.size() > 0) {	// 에러가 나는 경우 넘겨받은 데이터가
			log.info("실패...!");
			log.info("errors >> " + errors);
			model.addAttribute("memberVO", memberVO);
			goPage = "corpMgmt/addMember";
		}else {	
			ServiceResult result = myCorpMgmtService.addMember(memberVO);
			if(result.equals(ServiceResult.OK)) {
				log.info("멤버 추가 성공...");
				ra.addFlashAttribute("msg", "mem-insert-success");
				goPage = "redirect:/corpMgmt/member";
			}else {
				log.info("멤버 추가 실패...");
				model.addAttribute("memberVO", memberVO);
				return "corpMgmt/addMember";
			}
		}
		return goPage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> addMemberIdCheck(@RequestBody Map<String, String> map) {
		log.info("addMemberIdCheck() 실행...!");
		log.info("[아이디 중복확인] 넘겨받은 아이디 : " + map.get("memId"));
		ServiceResult result = myCorpMgmtService.addMemberIdCheck(map.get("memId"));
		log.info("memId : " + result);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);	
	}
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String memberList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model,
			Principal principal
			) {
		log.info("memberList() 실행...!");
		
		if(principal==null) {
			return "redirect:/login";
		}
		
		String memId = principal.getName();
		log.info("memberList page -> " + memId);
		
		PaginationInfoVO<MemberVO> pagingVO = new PaginationInfoVO<MemberVO>();		
		pagingVO.setMemId(memId);
		pagingVO.setCurrentPage(currentPage);

		int totalRecord = myCorpMgmtService.selectMemberCount(pagingVO); // recruiter테이블에서 count
		log.info("totalRecord >> " + totalRecord);
		pagingVO.setTotalRecord(totalRecord);
		
		List<MemberVO> dataList = myCorpMgmtService.selectMemberList(pagingVO);
		pagingVO.setDataList(dataList);
		log.info("dataList >>  " + dataList);
		model.addAttribute("pagingVO", pagingVO);
		return "corp/recruiter/addMember"; 
	}
	
	
}





