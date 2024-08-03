package kr.or.ddit.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ICommunityMapper;
import kr.or.ddit.service.ICommunityService;
import kr.or.ddit.vo.CommunityReplyVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.ComplaintVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class CommunityServiceImpl implements ICommunityService{

	@Inject
	private ICommunityMapper mapper;
	
//	@Override
//	public List<CommunityVO> communityMainList() {
//		return mapper.communityMainList();
//	}

	@Override
	public Map<String, Object> communityMainDetail(int communityNo) {
		
		mapper.incrementCommunityHit(communityNo);
		
		return mapper.communityMainDetail(communityNo);
	}

	@Override
	public List<Map<String, Object>> communityMainReply(int communityNo) {
		return mapper.communityMainReply(communityNo);
	}

//,,	@Override
//	public List<CommunityVO> searchCommunity(String searchType, String searchKeyword) {
//		
//		if("title".equals(searchType)) {
//			return mapper.searchByTitle(searchKeyword);
//		} else if("author".equals(searchType)) {
//			return mapper.searchByAuthor(searchKeyword);
//		}
//		
//		return new ArrayList<CommunityVO>();
//	}

	@Override
	public int communityInsert(CommunityVO community) {
		return mapper.communityInsert(community);
	}

	@Override
	public List<CommunityVO> communitySortRecent() {
		return mapper.communitySortRecent();
	}

	@Override
	public List<CommunityVO> communitySortViews() {
		return mapper.communitySortViews();
	}

	@Override
	public List<CommunityVO> communitySortMyPost(String memId) {
		return mapper.communitySortMyPost(memId);
	}
	
	@Override
	public void communityUpdate(CommunityVO community) {
		mapper.communityUpdate(community);
		
	}

	@Override
	public void communityDelete(CommunityVO community) {
		mapper.communityDelete(community);
		
	}

	@Override
	public void addReply(CommunityReplyVO reply) {
		mapper.addReply(reply);
	}

	@Override
	public int addRereply(Map<String, Object> replyData) {
		return mapper.addRereply(replyData);
	}
	
	
	@Override
	public void updateReply(CommunityReplyVO reply) {
		mapper.updateReply(reply);
	}
	
	@Override
	public void updateRereply(CommunityReplyVO rereply) {
		mapper.updateRereply(rereply);
	}

	@Override
	public void deleteReply(CommunityReplyVO reply) {
		mapper.deleteReply(reply);
		
	}

//	@Override
//	public List<CommunityVO> communityUserPost(String memId) {
//		return mapper.communityUserPost(memId);
//	}

	@Override
	public List<CommunityVO> communitySortRecentByUser(Map<String, Object> params) {
		return mapper.communitySortRecentByUser(params);
	}

	@Override
	public List<CommunityVO> communitySortViewsByUser(Map<String, Object> params) {
		return mapper.communitySortViewsByUser(params);
	}

	@Override
	public List<CommunityVO> searchCommunityByUser(Map<String,Object> map) {
			return mapper.searchCommunityByUser(map);
	}

	@Override
	public void reportCommunity(ComplaintVO complaint) {
		mapper.reportCommunity(complaint);
		
	}

	@Override
	public void updateCommunityWarnYN(int communityNo) {
		mapper.updateCommunityWarnYN(communityNo);
	}

	
	@Override
	public int getTotalRecord() {
		return mapper.getTotalRecord();
	}

	@Override
	public List<CommunityVO> getCommunityList(PaginationInfoVO<CommunityVO> paginationInfo) {
		return mapper.getCommunityList(paginationInfo);
	}

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	@Override
	public int countCommunityList(PaginationInfoVO<CommunityVO> pagingVO) {
		return mapper.countCommunityList(pagingVO);
	}

	@Override
	public List<CommunityVO> communityList(PaginationInfoVO<CommunityVO> pagingVO) {
		return mapper.communityList(pagingVO);
	}

	@Override
	public int countCommunityUserPost(String memId, PaginationInfoVO<CommunityVO> pagingVO) {
	    return mapper.countCommunityUserPost(memId, pagingVO);
	}

	@Override
	public List<CommunityVO> communityUserPost(String memId, PaginationInfoVO<CommunityVO> pagingVO) {
	    return mapper.communityUserPost(memId, pagingVO);
	}

	@Override
	public PaginationInfoVO<CommunityVO> searchCommunity(PaginationInfoVO<CommunityVO> pagingVO) {
	    int totalRecord = mapper.getSearchCount(pagingVO);
	    pagingVO.setTotalRecord(totalRecord);
	    
	    List<CommunityVO> communityList = mapper.searchCommunity(pagingVO);
	    pagingVO.setDataList(communityList);
	    
	    return pagingVO;
	}
}
