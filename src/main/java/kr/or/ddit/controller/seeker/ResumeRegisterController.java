package kr.or.ddit.controller.seeker;

import java.io.File;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.builder.HashCodeExclude;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IResumeService;
import kr.or.ddit.vo.CertificationVO;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.ResumeVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/resumeForm")
public class ResumeRegisterController {
	
	@Inject
	private IResumeService resumeService;
	
	@RequestMapping(value="/form")
	public String resumeRegisterMain(
			@RequestParam("resumeNo") int resumeNo,
			Principal principal,
			Model model, ResumeVO resumeVO) {
		log.info("resumeRegisterMain() 실행...!");
		
		if(principal == null) {
			return "redirect:/login";
		}
		
		String memId = principal.getName();

		// 회원 정보
		SeekerVO seekerVo = resumeService.getSeekerInfo(memId);
		// 학력 정보
		EducationVO educationVo = resumeService.getEducation(memId);
		// 기술스택 전체 목록
		List<ResumeSkillVO> skillList = resumeService.getTotalSkillName();
		// 이력서 정보
		ResumeVO resumeVo = resumeService.getResumeContent(resumeNo);
		// 보유 기술스택 목록
		List<ResumeSkillVO> userSkillList = resumeService.getUserSkillList(resumeNo);
		// 보유 경력 목록
		List<ResumeCareerVO> userCareerList = resumeService.getUserCareerList(resumeNo);
		// 보유 자격증 목록
		List<CertificationVO> userCertificationList = resumeService.getUserCertificationList(resumeNo);

		model.addAttribute("seekerVo", seekerVo); // 회원 정보
		model.addAttribute("educationVo", educationVo); // 학력 정보
		model.addAttribute("skillList", skillList); // 기술스택 전체 목록
		model.addAttribute("resumeVo", resumeVo); // 이력서 정보
		model.addAttribute("userSkillList", userSkillList); // 보유 기술스택 목록
		model.addAttribute("userCareerList", userCareerList); // 보유 경력 목록
		model.addAttribute("userCertificationList", userCertificationList); // 보유 자격증 목록
		
		return "seeker/resumeForm";
	}
	
	@RequestMapping(value="/basicInfo", method=RequestMethod.GET)
	public ResponseEntity<ResumeVO> basicResumeInfo(
			@RequestParam int resumeNo){
		
		log.info("basicResumeInfo() 실행...!");
		ResumeVO resumeVo = resumeService.getBasicResumeInfo(resumeNo);
		return new ResponseEntity<ResumeVO>(resumeVo, HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String resumeInsert(
			HttpServletRequest req, 
			@ModelAttribute ResumeVO resumeVO,
			Principal principal,
			Model model,
			RedirectAttributes ra
			) {
		log.info("resumeInsert() 실행...! resumeVO : " + resumeVO);

		String uploadPath = req.getServletContext().getRealPath("/resources/resumeProfile");
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String profileImg = "";
		try {
			MultipartFile profileImgFile = resumeVO.getResumeProfile();
			if(profileImgFile.getOriginalFilename() != null 
					&& !profileImgFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString(); 
				fileName += "_" + profileImgFile.getOriginalFilename(); 
				uploadPath += "/" + fileName;
				profileImgFile.transferTo(new File(uploadPath)); 
				profileImg = "/resources/resumeProfile/" + fileName;
			}
			resumeVO.setResumeProfileUrl(profileImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String goPage = "";
		resumeVO.setMemId(principal.getName());
		ServiceResult result = resumeService.addResumeAllContent(resumeVO);
		
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("msg", "insert-success");
			goPage = "redirect:/resume/mgmtMain";
		}else {
			goPage = "redirect:history:back";
		}
		return goPage;
	}
	

}
