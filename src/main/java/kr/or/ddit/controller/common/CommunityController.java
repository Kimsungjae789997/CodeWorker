package kr.or.ddit.controller.common;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.lang.StringUtils;
import org.apache.maven.doxia.logging.Log;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.ICommunityService;
import kr.or.ddit.vo.CommunityReplyVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.ComplaintVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class CommunityController {
	
	@Inject
	private ICommunityService service;
	
	// 커뮤니티 홈
	@RequestMapping(value = "/dashboard", method=RequestMethod.GET)
	public String communityMain() {
		return "dashboard";
	}
	
	
	// 커뮤니티 게시글 목록
	@RequestMapping(value = "/communityMainList", method=RequestMethod.GET)
	public String communityMainList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
							        @RequestParam(value = "size", defaultValue = "10") int screenSize,
									Model model) {
		
		PaginationInfoVO<CommunityVO> pagingVO = new PaginationInfoVO<CommunityVO>(screenSize, 5);
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.countCommunityList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<CommunityVO> communityList = service.communityList(pagingVO);
		pagingVO.setDataList(communityList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("communityMainList", communityList);
		
		return "communityMain";
	}

	
	// 커뮤니티 게시글 상세 보기(댓글까지)
	@RequestMapping(value = "/communityMainDetail", method=RequestMethod.GET)
	public String communityMainDetail(@RequestParam("communityNo") int communityNo, Model model) {
		
		Map<String, Object> communityMainDetail = service.communityMainDetail(communityNo);
		
		if(communityMainDetail != null) {
			List<Map<String, Object>> communityMainReply = service.communityMainReply(communityNo);
			
			model.addAttribute("communityMainDetail", communityMainDetail);
			model.addAttribute("communityMainReply", communityMainReply);
			
		} else {
			model.addAttribute("error", "해당 게시글을 찾을 수 없습니다");
		}
		
		return "communityDetail";
	}
	
	
	
	
	// 커뮤니티 검색(제목/작성자)
	@RequestMapping(value = "/communitySearch", method=RequestMethod.GET)
	public String searchCommunity(@RequestParam("searchType") String searchType,
	                              @RequestParam("searchKeyword") String searchKeyword,
	                              @RequestParam(value = "page", defaultValue = "1") int currentPage,
	                              Model model) {
	    
	    PaginationInfoVO<CommunityVO> pagingVO = new PaginationInfoVO<>();
	    
	    pagingVO.setSearchType(searchType);
	    pagingVO.setSearchWord(searchKeyword);
	    pagingVO.setCurrentPage(currentPage);
	    
	    pagingVO = service.searchCommunity(pagingVO);
	    
	    model.addAttribute("communityMainList", pagingVO.getDataList());
	    model.addAttribute("pagingVO", pagingVO);
	    model.addAttribute("searchType", searchType);
	    model.addAttribute("searchKeyword", searchKeyword);
	    
	    return "communityMain";
	}


	
	

	
	// 커뮤니티 글 쓰기 페이지
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/communityInsert", method=RequestMethod.GET)
	public String communityInsertForm() {
		return "communityInsert";
	}
	
	
	// 커뮤니티 글쓰기 처리
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/communityInsert", method=RequestMethod.POST)
	public String communityInsert(CommunityVO community, RedirectAttributes ra) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = user.getMember();
		
		community.setMemId(memberVO.getMemId());
		
		int result = service.communityInsert(community);
		
		if(result > 0) {
			ra.addFlashAttribute("message",	"글이 등록되었습니다");
		} else {
			ra.addFlashAttribute("message", "글 작성이 실패했습니다");
		}
		
		return "redirect:/communityMainList";
	}
	

	
	// 커뮤니티 최신순 / 조회순 / 내 작성글 보기
	@RequestMapping(value = "/communitySort", method=RequestMethod.GET)
	@ResponseBody
	public List<CommunityVO> sortCommunity(@RequestParam String sort, Principal principal){
		
		if("recent".equals(sort)) {
			return service.communitySortRecent();
		} else if ("views".equals(sort)) {
			return service.communitySortViews();
		} else if ("myPost".equals(sort)) {
			String memId = principal.getName();
			return service.communitySortMyPost(memId);
		}
		return new ArrayList<CommunityVO>();
	}
	
	
	// 커뮤니티 내 글 수정
	@RequestMapping(value = "/communityUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> communityUpdate(@RequestBody CommunityVO community){
		
		service.communityUpdate(community);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 커뮤니티 내 글 삭제
	@RequestMapping(value = "/communityDelete", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> communityDelte(@RequestBody CommunityVO community){
		
		service.communityDelete(community);
			
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 댓글 등록
	@RequestMapping(value = "/addReply", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addReply(@RequestBody CommunityReplyVO reply) {
		
	    try {
	        service.addReply(reply);
	        return new ResponseEntity<String>("success", HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	
	// 내가 작성한 댓글 수정
	@RequestMapping(value = "/updateReply", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateReply(@RequestBody CommunityReplyVO reply){
		
		service.updateReply(reply);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 내가 작성한 댓글 삭제
	@RequestMapping(value = "/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteReply(@RequestBody CommunityReplyVO reply){
		
		service.deleteReply(reply);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	
	// 대댓글 등록
	@RequestMapping(value = "/addRereply", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addRereply(@RequestBody Map<String, Object> replyData) {
	    try {
	        int result = service.addRereply(replyData);
	        if (result > 0) {
	            return new ResponseEntity<>("success", HttpStatus.OK);
	        } else {
	            return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    } catch (Exception e) {
	        return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	
	// 내가 작성한 대댓글 수정
	@RequestMapping(value = "/updateRereply", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateRereply(@RequestBody CommunityReplyVO rereply){
		
		service.updateRereply(rereply);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// 커뮤니티 메인페이지에서 - 다른 유저가 작성한 글 내역 보기
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/communityUserPost", method=RequestMethod.GET)
	public String communityUserPost(@RequestParam("memId") String memId,
            @RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
            @RequestParam(value = "size", defaultValue = "10") int screenSize,
            Model model) {

			PaginationInfoVO<CommunityVO> pagingVO = new PaginationInfoVO<CommunityVO>(screenSize, 5);
			pagingVO.setCurrentPage(currentPage);
			
			int totalRecord = service.countCommunityUserPost(memId, pagingVO);
			pagingVO.setTotalRecord(totalRecord);
			
			List<CommunityVO> communityUserPost = service.communityUserPost(memId, pagingVO);
			pagingVO.setDataList(communityUserPost);
			
			model.addAttribute("pagingVO", pagingVO);
			model.addAttribute("communityUserPost", communityUserPost);
			
			return "communityUserPost";
	}
	
	
	// 다른 유저 작성글 내역 페이지 최신순 / 조회순
	@RequestMapping(value = "/communitySortByUser", method=RequestMethod.GET)
	@ResponseBody
	public List<CommunityVO> sortCommunityByUser(@RequestParam String sort, @RequestParam String memId) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("memId", memId);
	    
	    if ("recent".equals(sort)) {
	        return service.communitySortRecentByUser(params);
	    } else if ("views".equals(sort)) {
	        return service.communitySortViewsByUser(params);
	    }
	    return new ArrayList<CommunityVO>();
	}
	
	
	// 다른 유저 게시글내역에서 - 검색(제목/작성자)
	@RequestMapping(value = "/searchCommunityByUser", method=RequestMethod.GET)
	public String searchCommunityByUser(@RequestParam("searchType") String searchType,
								  		@RequestParam("searchKeyword") String searchKeyword,
								  		@RequestParam("memId") String memId,
								  		Model model) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		map.put("memId", memId);
		
		List<CommunityVO> communityUserPost = service.searchCommunityByUser(map);
		
		model.addAttribute("communityUserPost", communityUserPost);
		
		return "communityUserPost";
	}
	
	
	// 게시글 신고
	@PreAuthorize("hasRole('ROLE_SEEKER')")
	@RequestMapping(value = "/reportCommunity", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> reportCommunity(@RequestBody ComplaintVO complaint){
		
		try {
			// 신고 내역 저장
			service.reportCommunity(complaint);
			
			// 신고된 게시글 신고 여부 업데이트
			service.updateCommunityWarnYN(complaint.getCommunityNo());
			
			return new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
