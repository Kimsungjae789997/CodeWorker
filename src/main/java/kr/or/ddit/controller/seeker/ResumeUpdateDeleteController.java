package kr.or.ddit.controller.seeker;

import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IResumeService;
import kr.or.ddit.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/resume")
public class ResumeUpdateDeleteController {
	
	@Inject
	private IResumeService resumeService;
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateResume(
			@ModelAttribute ResumeVO resumeVO,
			HttpServletRequest req,
			Principal principal,
			Model model,
			RedirectAttributes ra
			) {
		log.info("updateResume() 실행..!");
		
		String goPage = "";
		resumeVO.setMemId(principal.getName());
		ServiceResult result = resumeService.updateResumeAllContent(req, resumeVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("msg", "success");
			goPage = "redirect:/resume/mgmtMain";
		}else {
			model.addAttribute("resumeVO", resumeVO);
			ra.addFlashAttribute("msg", "fail");
			// resumeNo넣어주기
			goPage = "redirect:/resume/detail";
		}
		return goPage;
	}

}
