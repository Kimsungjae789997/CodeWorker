package kr.or.ddit.controller.recruiter;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IRecruitInsertService;
import kr.or.ddit.vo.CodingTestVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/recruitmentinsert")
public class RecruitmentInsertController {

	@Inject
	private IRecruitInsertService recruitInsertService;
	
	@PreAuthorize("hasRole('ROLE_RECRUITER')")
	@RequestMapping(value = "/insertForm", method = RequestMethod.GET)
	public String RecruitInsertForm() {
		return "corp/recruiter/recruitmentInsertForm";
	}
	
	//면접문항, 코딩테스트,면접준비 insert하는 곳
	@PreAuthorize("hasRole('ROLE_RECRUITER')")
	@RequestMapping(value = "insertForm2", method = RequestMethod.GET)
	public String RecruitInsertForm2() {
		return "corp/recruiter/recruitmentInsertForm2";
	}
	
	
	@RequestMapping(value = "/coteMain.do", method = RequestMethod.GET)
	public ResponseEntity<List<CodingTestVO>> coteMain(
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String searchWord
			) {
		log.info("coteMain() ==================== 실행");
		PaginationInfoVO<CodingTestVO> pagingVO = new PaginationInfoVO<CodingTestVO>();
		pagingVO.setSearchType(searchType);
		pagingVO.setSearchWord(searchWord);
		
		List<CodingTestVO> coteVO = recruitInsertService.coteMainSelect(pagingVO);
		return new ResponseEntity<List<CodingTestVO>>(coteVO,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/selectedCote", method = RequestMethod.POST)
	public ResponseEntity<List<CodingTestVO>> selectedCote(@RequestBody CodingTestVO codingTestVO){
		log.info("selectedCote() 실행====================");
		//codingTestVO.getArr();
		log.info("codingTestVO.getArr() -=====================: "  +codingTestVO.getArr());
		List<Integer> coteNoList = codingTestVO.getArr(); // 3,4,5가 담겨있음
		
		List<CodingTestVO> resultList = recruitInsertService.selectByCoteNoList(coteNoList);
		
		return new ResponseEntity<List<CodingTestVO>>(resultList,HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/intialInsert.do", method = RequestMethod.POST)
	public String intialInsert(@ModelAttribute  RecruitmentNoticeVO recruitmentNoticeVO, Model model
			,HttpServletRequest req){
		log.info("intialInsert() 실행 ===========================");
		log.info("recruitmentNoticeVO : == " + recruitmentNoticeVO);
		
		CustomUser user = 
				(CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = user.getMember();
		if(memberVO != null) {
			String crpId = recruitInsertService.selectCrpId(memberVO.getMemId());
			recruitmentNoticeVO.setCrpId(crpId);
			
			int cnt = recruitInsertService.intialInsert(recruitmentNoticeVO,req);
			if(cnt > 0) {
				model.addAttribute("recruitmentNoticeVO", recruitmentNoticeVO);
				return "corp/recruiter/recruitmentInsertForm2";
			}
		}

		return null;
	};
	
	
	@RequestMapping(value = "/lastInsert.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> lastInsert(@RequestBody RecruitmentNoticeVO recruitmentNoticeVO){
	    log.info("lastInsert() 실행 ===========================");
	    log.info("recruitmentNoticeVO : == " + recruitmentNoticeVO);
		
	    ServiceResult result = recruitInsertService.lastInsert(recruitmentNoticeVO);
	    
	    
	    return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	
//	@RequestMapping(value = "/coteList.do", method = RequestMethod.GET)
//	public String coteList(
//			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
//			@RequestParam(required = false, defaultValue = "title") String searchType,
//			@RequestParam(required = false) String searchWord,
//			Model model
//			) {
//		log.info("coteList()실행===========================");		
//		
//		PaginationInfoVO<CodingTestVO> pagingVO = new PaginationInfoVO<CodingTestVO>(10,5);
//		if(StringUtils.isNotBlank(searchWord)) {
//			pagingVO.setSearchType(searchType);
//			pagingVO.setSearchWord(searchWord);
//			
//			// 검색 후, 목록 페이지로 이동 할 때 검색된 내용을 적용시키기 위한 데이터 전달
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchWord", searchWord);
//		}
//		
//		pagingVO.setCurrentPage(currentPage);	
//		int totalRecord = recruitInsertService.selectCoteCount(pagingVO);	
//		pagingVO.setTotalRecord(totalRecord);
//		List<CodingTestVO> dataList = recruitInsertService.selectCoteList(pagingVO);
//		pagingVO.setDataList(dataList);	
//		model.addAttribute("pagingVO", pagingVO);
//		
//		
//		return "";
//	
//	};
	
}
