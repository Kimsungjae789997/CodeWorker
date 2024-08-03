package kr.or.ddit.controller.common;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.ICommonService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SignupController {

	@Inject
	private ICommonService commonService;
	
	@GetMapping("/signupForm.do")
	public String signForm() {
		return "signupForm";
	}
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signup(
			Model model,MemberVO memberVO,RedirectAttributes ra
			) {
		String goPage = "";	// 페이지 이동 경로를 담을 공간
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(memberVO.getMemId())) {
			errors.put("memId", "아이디를 입력해주세요!");
		}
		// 넘겨받은 비밀번호 데이터가 비어있을때 에러 설정
		if(StringUtils.isBlank(memberVO.getMemPw())) {
			errors.put("memPw", "비밀번호를 입력해주세요!");
		}
		// 넘겨받은 이름 데이터가 비어있을때 에러 설정
		if(StringUtils.isBlank(memberVO.getMemName())) {
			errors.put("memName", "이름을 입력해주세요!");
		}
		
		if(errors.size() > 0) {	// 에러가 나는 경우 넘겨받은 데이터가
			model.addAttribute("memberVO", memberVO);
			goPage = "signupForm";
		}else {	// 데이터 정상
			ServiceResult result = commonService.signup(memberVO);
			if(result.equals(ServiceResult.OK)) {
				goPage = "redirect:/login";
			}else {
				model.addAttribute("memberVO", memberVO);
				return "signupForm";
			}
		}
		return goPage;
	}
	
	
	@GetMapping("/signupRecruiterForm.do")
	public String signupRecruiterForm() {
		return "signupRecruiterForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/seeker/idCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> seekerIdCheck(@RequestBody Map<String,String> map) {
		log.info("[아이디 중복확인] 넘겨받은 아이디 : " + map.get("memId"));
		ServiceResult result = commonService.seekerIdCheck(map.get("memId"));
		log.info("memId : " + result);
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);	
	}
	
	// 일반회원 회원가입 - 휴대폰 번호 인증api
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = 1234;//난수 생성

		commonService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return Integer.toString(randomNumber);
	}
	
	// 모달창 이미지 누르면 경력,신입여부와 인재제안여부 insert하기
	@RequestMapping(value = "/addInsert.do", method = RequestMethod.POST)
	public String addInsert(MemberVO memberVO) {
		SeekerVO seekerVO = memberVO.getSeekerVO();
		
		if(seekerVO.getSeekerStatusCode().equals("T")) {
			seekerVO.setSeekerStatusCode("OPN0101");
		}
		if(seekerVO.getSeekerStatusCode().equals("F")) {
			seekerVO.setSeekerStatusCode("OPN0102");
		}
		if(seekerVO.getSeekerExp().equals("new")) {
			seekerVO.setSeekerExp("신입");
		}
		if(seekerVO.getSeekerExp().equals("exp")) {
			seekerVO.setSeekerExp("경력");
		}
		
		commonService.addInsert(seekerVO);
		
		return "redirect:/main/list.do";
	}
	
}
