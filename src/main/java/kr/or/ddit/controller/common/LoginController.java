package kr.or.ddit.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {

	
	@GetMapping("/login")
	public String login(String error, String logout, Model model) {
		//오류 발생 시
		if(error!=null) {
			model.addAttribute("error", "Login Error!!");
		}
		
		if(logout!=null) {
			model.addAttribute("logout", "Logout!!!");
		}
		
		//forwarding : jsp
		return "loginForm";
	}
	

}
