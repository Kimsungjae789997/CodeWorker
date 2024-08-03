package kr.or.ddit.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {
	//접근 거부 처리
	//요청URI : /accessError
	//요청방식 : get
	@GetMapping("/accessError")
	public String accessError(Authentication auth, Model model) {
		log.info("accessError->auth : " + auth);
		model.addAttribute("msg", "접근 권한이 없습니다!");
		
		//forwarding : jsp
		return "accessError";
	}
}