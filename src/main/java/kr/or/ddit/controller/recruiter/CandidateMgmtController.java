package kr.or.ddit.controller.recruiter;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IProposalService;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ProposalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/candidate")
public class CandidateMgmtController {
	
	@Inject
	private IProposalService proposalService;

	@RequestMapping(value="/list")
	public String candidateList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Principal principal,			
			Model model
			) {
		log.info("candidateList() ");
		
		if(principal==null) {
			return "redirect:/login";
		}
		String memId = principal.getName();
		
		PaginationInfoVO<ProposalVO> pagingVO = new PaginationInfoVO<ProposalVO>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setMemId(memId);
		
		int totalRecord = proposalService.selectProposalCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<ProposalVO> dataList = proposalService.selectProposalList(pagingVO);
		
		log.info("dataList >> " + dataList);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		
		log.info("candidateList() 실행...! ");
		return "corp/recruiter/candidateList";
	}
	
}
