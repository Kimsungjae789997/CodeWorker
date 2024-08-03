package kr.or.ddit.controller.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Controller
@RequestMapping("/")
public class boardController {

	@Inject
	private IBoardService service;
	
	
	// FAQ 게시글 목록
	@RequestMapping(value = "/faqMain", method = RequestMethod.GET)
	public String faqMainList(@RequestParam(value = "boardTargetCode", required = false) String boardTargetCode,
							  @RequestParam(value = "page", defaultValue = "1") int currentPage,
							  @RequestParam(value = "size", defaultValue = "10") int screenSize,
							  Model model) {
	    
		String boardTypeCode = "BOT0102"; // 고정된 값(FAQ)
	    
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<>(screenSize, 5);
	    pagingVO.setCurrentPage(currentPage);
	    pagingVO.setBoardTypeCode(boardTypeCode);
	    pagingVO.setBoardTargetCode(boardTargetCode != null ? boardTargetCode : "");
	    
	    int totalRecord = service.countNoticeList(pagingVO);
	    pagingVO.setTotalRecord(totalRecord);

	    
	    List<BoardVO> faqList = service.noticeList(pagingVO);
	    pagingVO.setDataList(faqList);
	    
	    model.addAttribute("faqList", faqList);
	    model.addAttribute("pagingVO", pagingVO);
	    
	    return "faqMain";
	}
	
	// FAQ 상세 보기
	@RequestMapping(value = "/faqDetail", method=RequestMethod.GET)
	public String adminViewFAQDetail(@RequestParam("boardNo") int boardNo, Model model) {

		BoardVO faqDetail = service.noticeDetail(boardNo);
		
		model.addAttribute("faqDetail", faqDetail);
		
		return "faqDetail";
	}
	
	
	
	// 공지 게시글 목록
	@RequestMapping(value = "/noticeMain", method = RequestMethod.GET)
	public String adminViewNotice(@RequestParam(value = "boardTargetCode", required = false) String boardTargetCode,
					              @RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
					              @RequestParam(value = "size", defaultValue = "10") int screenSize,
					              Model model) {
	    
	    String boardTypeCode = "BOT0101"; // 고정된 값

	    PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<>(screenSize, 5);
	    pagingVO.setCurrentPage(currentPage);
	    pagingVO.setBoardTypeCode(boardTypeCode);
	    pagingVO.setBoardTargetCode(boardTargetCode != null ? boardTargetCode : "");

	    int totalRecord = service.countNoticeList(pagingVO);
	    pagingVO.setTotalRecord(totalRecord);

	    List<BoardVO> noticeList = service.noticeList(pagingVO);
	    pagingVO.setDataList(noticeList);

	    model.addAttribute("noticeList", noticeList);
	    model.addAttribute("pagingVO", pagingVO);
	    
	    return "noticeMain";
	}
	
	
	// 공지 상세 보기
	@RequestMapping(value = "/noticeDetail", method=RequestMethod.GET)
	public String adminViewNoticeDetail(@RequestParam("boardNo") int boardNo, Model model) {

		BoardVO noticeDetail = service.noticeDetail(boardNo);
		
		model.addAttribute("noticeDetail", noticeDetail);
		
		return "noticeDetail";
	}
	
	
}
