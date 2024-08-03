package kr.or.ddit.controller.seeker;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IResumeService;
import kr.or.ddit.vo.CertificationVO;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeFileVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.ResumeVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/resume")
public class ResumeMgmtController {
   
   @Inject
   private IResumeService resumeService;
   
   @RequestMapping(value="/mgmtMain")
   public String resumeMgmtMain(Principal principal) {
      log.info("resumeMgmtMain() 실행...!");
      
      if(principal == null) {
         return "redirect:/login";
      }
      //String memId = principal.getName();
      return "seeker/resumeMgmt";
   }
   
   
   @RequestMapping(value="/detail", method = RequestMethod.GET)
   public String resumeDetail(
		   @RequestParam("resumeNo") int resumeNo,
		   Principal principal, 
		   Model model, 
		   ResumeVO resumeVO) {
      log.info("resumeDetail() 실행...!");

      if(principal == null) {
         return "redirect:/login";
      }
      
      String memId = principal.getName();
      
		// 회원 정보
		SeekerVO seekerVo = resumeService.getSeekerInfo(memId);
		model.addAttribute("seekerVo", seekerVo);
		
		// 학력 정보
		EducationVO educationVo = resumeService.getEducation(memId);
		model.addAttribute("educationVo", educationVo);
		log.info("educationVo -> ", educationVo);
		
		// 기술스택 전체 목록
		List<ResumeSkillVO> skillList = resumeService.getTotalSkillName();
		model.addAttribute("skillList", skillList);
		
		// 이력서 정보
		ResumeVO resumeVo = resumeService.getResumeContent(resumeNo);
		model.addAttribute("resumeVo", resumeVo);
		
		// 보유 기술스택 목록
		List<ResumeSkillVO> userSkillList = resumeService.getUserSkillList(resumeNo);
		model.addAttribute("userSkillList", userSkillList);
		
		// 보유 경력 목록
		List<ResumeCareerVO> userCareerList = resumeService.getUserCareerList(resumeNo);
		model.addAttribute("userCareerList", userCareerList);
		
		// 보유 자격증 목록
		List<CertificationVO> userCertificationList = resumeService.getUserCertificationList(resumeNo);
		model.addAttribute("userCertificationList", userCertificationList);
      
      return "seeker/resumeDetail";
   }
   
   
   @RequestMapping(value = "/resumeAdd", method = RequestMethod.POST)
   public ResponseEntity<ResumeVO> resumeAdd(@RequestBody ResumeVO vo){
      log.info("resumeAdd() 실행================");
      ResumeVO resumeVO = null;
      int cnt = resumeService.resumeAdd(vo);
      if(cnt > 0) {
         log.info("resumeNo ================" + vo.getResumeNo());
         resumeVO = resumeService.getResume(vo.getResumeNo());
         resumeVO.setResumeWriteYn("작성 중");
      }
      return new ResponseEntity<ResumeVO>(resumeVO,HttpStatus.OK);
   }
   
   @RequestMapping(value = "/getResumes", method = RequestMethod.POST)
   public ResponseEntity<List<ResumeVO>> getResumes(@RequestBody ResumeVO resumeVO){
      log.info("getResumes() 실행============");
      List<ResumeVO> resumeList = resumeService.getResumes(resumeVO.getMemId());
      for(ResumeVO vo : resumeList) {
         if(vo.getResumeWriteYn().equals("N")) {
            vo.setResumeWriteYn("작성 중");         
         }else {
            vo.setResumeWriteYn("작성 완료");
         }
      }
      return new ResponseEntity<List<ResumeVO>>(resumeList, HttpStatus.OK);   
   }

   

   @RequestMapping(value = "/resumeNameUpdate", method = RequestMethod.POST)
   public ResponseEntity<ResumeVO> resumeNameUpdate(@RequestBody ResumeVO resumeVO){
      log.info("resumeNameUpdate() 실행========================");

      ResumeVO vo = resumeService.resumeNameUpdate(resumeVO);
      return new ResponseEntity<ResumeVO>(vo,HttpStatus.OK);
   }
   
   @RequestMapping(value = "/resumeDelete", method = RequestMethod.POST)
   public ResponseEntity<ServiceResult> resumeDelete(@RequestBody ResumeVO resumeVO){
      log.info("resumeDelete() 실행 ================");
      ServiceResult result = null;
      
      result = resumeService.resumeDelete(resumeVO);
      return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
   }
   
   @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
   public ResponseEntity<ServiceResult> uploadFile(ResumeFileVO fileVO, HttpServletRequest req){
      log.info("uploadFile() 실행===============");
      ServiceResult result = null;
      result = resumeService.uploadFile(req, fileVO);
      
      return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
   }
   
      @RequestMapping(value = "/download", method = RequestMethod.GET)
   public View fileDownload(@RequestParam("fileNo") int fileNo, ModelMap model) {
       ResumeFileVO resumeFileVO = resumeService.resumeDownload(fileNo);
       
       Map<String, Object> resumeFileMap = new HashMap<String, Object>();
       resumeFileMap.put("fileName", resumeFileVO.getFileName());
       resumeFileMap.put("fileSize", resumeFileVO.getFileSize());
       resumeFileMap.put("fileSavePath", resumeFileVO.getFileSavepath());
       model.addAttribute("resumeFileMap", resumeFileMap);
       
       return new ResumeDownloadView();
   }
   
}
