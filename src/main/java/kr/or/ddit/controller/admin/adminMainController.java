package kr.or.ddit.controller.admin;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IAdminService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommunityReplyVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.ComplaintVO;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.JoinReqCrpVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.QuestionReplyVO;
import kr.or.ddit.vo.QuestionVO;
import kr.or.ddit.vo.RecruiterVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class adminMainController {
	
	@Inject
	private IAdminService service;
	
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public String main() {
		return "dashboard";
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	// 관리자 - 메인페이지
	
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public String adminMainPage(@RequestParam(value = "boardTargetCode", required = false) String boardTargetCode, Model model) {
		
		int seekerNum = service.seekerNum();
		int crpNum = service.crpNum();
		int recNtcNum = service.recNtcNum();
		model.addAttribute("seekerNum", seekerNum);
		model.addAttribute("crpNum", crpNum);
		model.addAttribute("recNtcNum", recNtcNum);
		
		
		String boardTypeCode = "BOT0101"; // 고정된 값
		Map<String, String> params = new HashMap<>();
		params.put("boardTypeCode", boardTypeCode);
	    params.put("boardTargetCode", boardTargetCode != null ? boardTargetCode : "");
	    List<BoardVO> adminMainNoticeList = service.adminMainNoticeList(params);
	    model.addAttribute("adminMainNoticeList", adminMainNoticeList);
		
	    
	    boardTypeCode = "BOT0102"; // 고정된 값
		params.clear();
		params.put("boardTypeCode", boardTypeCode);
	    params.put("boardTargetCode", boardTargetCode != null ? boardTargetCode : "");
	    List<BoardVO> adminMainFaqList = service.adminMainNoticeList(params);
	    model.addAttribute("adminMainFaqList", adminMainFaqList);

	    
	    List<QuestionVO> adminMainQuestionList = service.adminMainQuestionList();
		model.addAttribute("adminMainQuestionList", adminMainQuestionList);
	    
		
	    List<CommunityVO> adminCommunityMainList = service.adminCommunityMainList();
		model.addAttribute("adminCommunityMainList", adminCommunityMainList);
		
		
		// 통계 (가장 많이 북마크에 추가된 공고순)
		List<Map<String,Object>> map1 = this.service.bookMarkList();
		log.info("map1 : " + map1);
		model.addAttribute("map1", map1);
		
		// 통계 (관심기업순)
		List<Map<String,Object>> map2 = this.service.bookMarkList2();
		log.info("map2 : " + map2);
		model.addAttribute("map2", map2);
		
		// 통계 (지원율이 가장 많은 기업순)
		List<Map<String,Object>> map3 = this.service.bookMarkList3();
		log.info("map3 : " + map3);
		model.addAttribute("map3", map3);
		
		// 통계(가장 많이 조회된 공고순)
		List<Map<String,Object>> map4 = this.service.bookMarkList4();
		log.info("map4 : " + map4);
		model.addAttribute("map4", map4);
		
		return "admin/adminMain";
	}
	
	@ResponseBody
	@PostMapping("/getTg")
	public List<Map<String,Object>> getTg(){
		//통계(북마크순 - 좋아요 깃발 공고)
		List<Map<String,Object>> map1 = this.service.bookMarkList();
		log.info("map1 : " + map1);
		
		return map1;
	}
	
	
	// 관리자 - 메인페이지 - 가입신청기업
	@RequestMapping(value = "/adminMainRequestJoinCrpList", method=RequestMethod.GET)
	public String adminMainRequestJoinCrpList(Model model) {
		
		List<JoinReqCrpVO> adminMainRequestJoinCrpList = service.adminMainRequestJoinCrpList();
		
		model.addAttribute("adminMainRequestJoinCrpList", adminMainRequestJoinCrpList);
				
		return "admin/adminMain";
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - 구직자 회원 목록 조회
	@RequestMapping(value = "/seekerList", method=RequestMethod.GET)
	public String adminViewSeekerList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
							          @RequestParam(value = "size", defaultValue = "10") int screenSize,	
							          Model model) {
		
		PaginationInfoVO<SeekerVO> pagingVO = new PaginationInfoVO<SeekerVO>(screenSize, 5);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.countSeekerList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<SeekerVO> seekerList = service.seekerList(pagingVO);
		pagingVO.setDataList(seekerList);
		
		model.addAttribute("pagingVO", pagingVO);		
		model.addAttribute("seekerList", seekerList);
		
		return "admin/adminViewSeekerList";
	}
	
	
	// 관리자 - 구직자 회원 한명 상세 조회
	@RequestMapping(value = "/seekerDetail", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<SeekerVO> adminSeekerDetail(@RequestParam("memId") String memId){
		
		SeekerVO seekerDetail = new SeekerVO();
		
		seekerDetail.setMemId(memId);
		
		SeekerVO result = service.seekerDetail(seekerDetail);
		
		return new ResponseEntity<SeekerVO>(result, HttpStatus.OK);
	}
	
	
	// 관리자 - 구직자 회원 정보 수정
	@RequestMapping(value = "/seekerUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminSeekerUpdate(@RequestBody SeekerVO seeker) {
	    
		service.updateSeeker(seeker);
	    
	    return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 구직자 회원 탈퇴 처리
	@RequestMapping(value = "/seekerRemove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminSeekerRemove(@RequestBody SeekerVO seeker){
		
		service.seekerRemove(seeker);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}

	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - 구인자 회원 목록 조회
	@RequestMapping(value = "/recruiterList", method=RequestMethod.GET)
	public String adminViewRecruiterList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
								         @RequestParam(value = "size", defaultValue = "10") int screenSize,
								         Model model) {
		
		PaginationInfoVO<RecruiterVO> pagingVO = new PaginationInfoVO<RecruiterVO>(screenSize, 5);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.countRecruiterList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<RecruiterVO> recruiterList = service.recruiterList(pagingVO);
		pagingVO.setDataList(recruiterList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("recruiterList", recruiterList);
		
		return "admin/adminViewRecruiterList";
	}
	
	
	// 관리자 - 구인자 회원 한명 상세 조회
	@RequestMapping(value = "/recruiterDetail", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<Object, String>> adminViewRecruiterDetail(@RequestParam("memId") String memId) {
	    
	    Map<Object, String> recruiterDetail = service.recruiterDetail(memId);
	    
	    return new ResponseEntity<>(recruiterDetail, HttpStatus.OK);
	}
	
	
	// 관리자 - 구인자 회원 정보 수정
	@RequestMapping(value = "/recruiterUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminRecruiterUpdate(@RequestBody RecruiterVO recruiter) {
	    
		service.updateRecruiter(recruiter);
	    
	    return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 구인자 회원 탈퇴 처리
	@RequestMapping(value = "/recruiterRemove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminRecruiterRemove(@RequestBody RecruiterVO recruiter){
		
		service.recruiterRemove(recruiter);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - 기업 목록 조회
	@RequestMapping(value = "/crpList", method=RequestMethod.GET)
	public String adminViewCrpList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
	          					   @RequestParam(value = "size", defaultValue = "10") int screenSize,
	          					   Model model) {
		
		PaginationInfoVO<CorporationVO> pagingVO = new PaginationInfoVO<CorporationVO>(screenSize, 5);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.countCrpList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<CorporationVO> crpList = service.crpList(pagingVO);
		pagingVO.setDataList(crpList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("crpList", crpList);
		
		return "admin/adminViewCrpList";
	}

	
	// 관리자 - 기업 상세 조회
	@RequestMapping(value = "/crpDetail", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<CorporationVO> adminViewCrpDetail(@RequestParam("crpId") String crpId) {
		
		CorporationVO crpDetail = new CorporationVO();
		
		crpDetail.setCrpId(crpId);
		
		CorporationVO result = service.crpDetail(crpDetail);
		
		return new ResponseEntity<CorporationVO>(result, HttpStatus.OK);
	}
	
	
	// 관리자 - 기업 정보 수정
	@RequestMapping(value = "/crpUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminCrpUpdate(@RequestBody CorporationVO crp){
		
		service.crpUpdate(crp);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 기업 탈퇴 처리
	@RequestMapping(value = "/crpRemove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminCrpRemove(@RequestBody CorporationVO crp){
		
		service.crpRemove(crp);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - 가입 신청 기업 목록 조회
	@RequestMapping(value = "/crpRequestJoinList", method=RequestMethod.GET)
	public String adminRequestJoinCrpList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
								          @RequestParam(value = "size", defaultValue = "10") int screenSize,
								          Model model) {
		
		PaginationInfoVO<JoinReqCrpVO> pagingVO = new PaginationInfoVO<JoinReqCrpVO>(screenSize, 5);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.countjrCrpList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<JoinReqCrpVO> jrCrpList = service.jrCrpList(pagingVO);
		pagingVO.setDataList(jrCrpList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("jrCrpList", jrCrpList);
				
		return "admin/adminViewRequestJoinCrpList";
	}
	
	
	// 관리자 - 가입 신청 기업 상세 조회
	@RequestMapping(value = "/crpRequestJoinDetail", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<JoinReqCrpVO> adminRequestJoinCrpDetail(@RequestParam("joReqCrpId") String jrCrpId) {
		
		JoinReqCrpVO jrCrp = new JoinReqCrpVO();
		
		jrCrp.setJoReqCrpId(jrCrpId);
		
		JoinReqCrpVO result = service.jrCrpDetail(jrCrp);
		
		return new ResponseEntity<JoinReqCrpVO>(result, HttpStatus.OK);
	}
	
	
	// 관리자 - 가입 신청 기업 승인 / 반려
	@RequestMapping(value = "/crpRequestJoinUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminUpdateCrp(@RequestBody JoinReqCrpVO joinReqCrpVO) {
		
		try {
			service.jrCrpUpdate(joinReqCrpVO);
			return ResponseEntity.ok("success");
			
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
		}
	}
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - 커뮤니티 게시판 조회
	@RequestMapping(value = "/communityList", method=RequestMethod.GET)
	public String adminViewCommunityList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
								         @RequestParam(value = "size", defaultValue = "10") int screenSize,
										 Model model) {
		
		PaginationInfoVO<CommunityVO> pagingVO = new PaginationInfoVO<CommunityVO>(screenSize, 5);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.countCommunityList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<CommunityVO> communityList = service.communityList(pagingVO);
		pagingVO.setDataList(communityList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("communityList", communityList);
		
		return "admin/adminViewCommunityList";
	}
	
	// 관리자 - 커뮤니티 게시판 등록일순(최신순) 조회
	@RequestMapping(value = "/communitySort", method=RequestMethod.GET)
	@ResponseBody
	public List<CommunityVO> sortCommunity(@RequestParam String sort, Principal principal){
		if("recent".equals(sort)){
			return service.communitySortRecent();
		}
		return new ArrayList<CommunityVO>();
	}
	
	
	// 관리자 - 커뮤니티 게시판 상세 조회(댓글까지)
	@RequestMapping(value = "/communityDetail", method=RequestMethod.GET)
	public String adminViewCommunityDetail(@RequestParam("communityNo") int communityNo, Model model) {
		
		Map<String, Object> communityDetail = service.communityDetail(communityNo);
		
		if(communityDetail != null) {
			List<Map<String, Object>> communityReply = service.communityReply(communityNo);
			
			model.addAttribute("communityDetail", communityDetail);
			model.addAttribute("communityReply", communityReply);
			
		} else {
			model.addAttribute("error", "해당 게시글을 찾을 수 없습니다");
		}
		
		return "admin/adminViewCommunityDetail";
	}
	
	
	// 관리자 - 커뮤니티 게시판 게시글 수정
	@RequestMapping(value = "/communityUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminCommunityUpdate(@RequestBody CommunityVO community){
		
		service.communityUpdate(community);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 커뮤니티 댓글 수정
	@RequestMapping(value = "/replyUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminReplyUpdate(@RequestBody CommunityReplyVO reply){
		
		service.replyUpdate(reply);
		
		log.info(" #### reply : " + reply);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 커뮤니티 게시글 삭제
	@RequestMapping(value = "/communityRemove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminCommunityRemove(@RequestBody CommunityVO community){
		
		service.communityRemove(community);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 커뮤니티 댓글 삭제
	@RequestMapping(value = "/replyRemove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminReplyRemove(@RequestBody CommunityReplyVO reply){
		
		service.replyRemove(reply);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 커뮤니티 게시글 신고 내역 조회
	@RequestMapping(value = "/complaintDetail", method=RequestMethod.GET)
	public ResponseEntity<ComplaintVO> complaintDetail(@RequestParam("communityNo") int communityNo){
		
		ComplaintVO complaintDetail = new ComplaintVO();
		
		complaintDetail.setCommunityNo(communityNo);
		
		ComplaintVO result = service.complaintDetail(complaintDetail);
		
		return new ResponseEntity<ComplaintVO>(result, HttpStatus.OK);
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - 공지사항 게시판 조회(typeCode 가 BOT0101인 데이터만)
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
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

	    return "admin/adminViewNoticeList";
	}
	
	
	// 관리자 - 공지사항 상세 조회
	@RequestMapping(value = "/noticeDetail", method=RequestMethod.GET)
	public String adminViewNoticeDetail(@RequestParam("boardNo") int boardNo, Model model) {

		BoardVO noticeDetail = service.noticeDetail(boardNo);
		
		model.addAttribute("noticeDetail", noticeDetail);
		
		return "admin/adminViewNoticeDetail";
	}
	
	
	// 관리자 - 공지사항 수정
	@RequestMapping(value = "/noticeUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminNoticeUpdate(@RequestBody BoardVO board){
		
		service.noticeUpdate(board);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 공지사항 삭제(Y/N)
	@RequestMapping(value = "/noticeRemove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminNoticeRemove(@RequestBody BoardVO board){
		
		service.noticeRemove(board);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - 공지사항 등록 페이지
	@RequestMapping(value = "/noticeInsert", method=RequestMethod.GET)
	public String adminNoticeInsertForm() {
		
		return "admin/adminInsertNotice";
	}
	
	
	// 관리자 - 공지사항 등록 처리
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String adminNoticeInsert(BoardVO board, RedirectAttributes ra) {
	    
		board.setBoardTypeCode("BOT0101"); // 공지사항 코드 설정
	    
		int result = service.noticeInsert(board);
	    
	    if (result > 0) {
	    	ra.addFlashAttribute("message", "공지사항이 성공적으로 등록되었습니다.");
	    } else {
	    	ra.addFlashAttribute("message", "공지사항 등록에 실패했습니다.");
	    }
	    
	    return "redirect:/admin/noticeList";
	}
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - FAQ 게시판 조회
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String adminViewFAQ(@RequestParam(value = "boardTargetCode", required = false) String boardTargetCode,
								@RequestParam(value = "page", defaultValue = "1") int currentPage,
								@RequestParam(value = "size", defaultValue = "10") int screenSize,
								Model model) {
	    
		String boardTypeCode = "BOT0102"; // 고정된 값
	    
		
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
	    
	    return "admin/adminViewFAQList";
	}
	
	
	// 관리자 - FAQ 상세 조회
	@RequestMapping(value = "/faqDetail", method=RequestMethod.GET)
	public String adminViewFAQDetail(@RequestParam("boardNo") int boardNo, Model model) {

		BoardVO faqDetail = service.noticeDetail(boardNo);
		
		model.addAttribute("faqDetail", faqDetail);
		
		return "admin/adminViewFAQDetail";
	}
	
	
	// 관리자 - FAQ 수정
	@RequestMapping(value = "/faqUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminFAQUpdate(@RequestBody BoardVO board){
		
		service.noticeUpdate(board);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - FAQ 삭제(Y/N)
	@RequestMapping(value = "/faqRemove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> adminFAQRemove(@RequestBody BoardVO board){
		
		service.noticeRemove(board);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 관리자 - FAQ 등록 페이지
	@RequestMapping(value = "/faqInsert", method=RequestMethod.GET)
	public String adminFAQInsertForm() {
		
		return "admin/adminInsertFAQ";
	}
	
	
	// 관리자 - FAQ 등록 처리
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public String adminFAQInsert(BoardVO board, RedirectAttributes ra) {
	    
		board.setBoardTypeCode("BOT0102"); // 공지사항 코드 설정
	    
		int result = service.noticeInsert(board);
	    
	    if (result > 0) {
	    	ra.addFlashAttribute("message", "공지사항이 성공적으로 등록되었습니다.");
	    } else {
	    	ra.addFlashAttribute("message", "공지사항 등록에 실패했습니다.");
	    }
	    
	    return "redirect:/admin/faqList";
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
	// 관리자 - 문의게시판 조회
	@RequestMapping(value = "/questionList", method=RequestMethod.GET)
	public String adminViewQuestion(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
							        @RequestParam(value = "size", defaultValue = "10") int screenSize,
									Model model) {
		
		PaginationInfoVO<QuestionVO> pagingVO = new PaginationInfoVO<QuestionVO>(screenSize, 5);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.countQuestionList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<QuestionVO> questionList = service.questionList(pagingVO);
		pagingVO.setDataList(questionList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("questionList", questionList);
		
		return "admin/adminViewQuestionList";
	}
	
	
	// 관리자 - 문의내역 상세 보기
	@RequestMapping(value = "/questionDetail", method=RequestMethod.GET)
	public String adminViewQuestionDetail(@RequestParam("questionNo") int questionNo, Model model){
		
		QuestionVO questionDetail = service.questionDetail(questionNo);
		
		model.addAttribute("questionDetail", questionDetail);
		
		return "admin/adminViewQuestionDetail";
	}
	
	
	// 관리자 - 문의내역 답변하기
	@RequestMapping(value = "/questionAnswer", method=RequestMethod.POST)
	public ResponseEntity<String> adminQuestionAnswer(@RequestBody QuestionReplyVO reply){
		
		try {
			service.answerQuestion(reply);
			return new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	// 관리자 - 답변 내역 보기
	@RequestMapping(value = "/answerDetail", method = RequestMethod.GET)
	public ResponseEntity<QuestionReplyVO> adminViewAnswerDetail(@RequestParam("questionNo") int questionNo) {
		try {
			QuestionReplyVO reply = service.answerDetail(questionNo);
			if (reply != null) {
				return new ResponseEntity<QuestionReplyVO>(reply, HttpStatus.OK);
			} else {
				return new ResponseEntity<QuestionReplyVO>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			return new ResponseEntity<QuestionReplyVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
}