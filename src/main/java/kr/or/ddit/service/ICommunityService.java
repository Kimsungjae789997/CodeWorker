package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CommunityReplyVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.ComplaintVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface ICommunityService {

	//List<CommunityVO> communityMainList();

	Map<String, Object> communityMainDetail(int communityNo);

	List<Map<String, Object>> communityMainReply(int communityNo);

	//,,List<CommunityVO> searchCommunity(String searchType, String searchKeyword);

	int communityInsert(CommunityVO community);

	List<CommunityVO> communitySortRecent();

	List<CommunityVO> communitySortViews();

	List<CommunityVO> communitySortMyPost(String memId);

	void communityUpdate(CommunityVO community);
	
	void communityDelete(CommunityVO community);

	void addReply(CommunityReplyVO reply);
	
	int addRereply(Map<String, Object> replyData);
	
	void updateReply(CommunityReplyVO reply);
	
	void updateRereply(CommunityReplyVO rereply);

	void deleteReply(CommunityReplyVO reply);

	//List<CommunityVO> communityUserPost(String memId);

	List<CommunityVO> communitySortRecentByUser(Map<String, Object> params);

	List<CommunityVO> communitySortViewsByUser(Map<String, Object> params);

	List<CommunityVO> searchCommunityByUser(Map<String,Object> map);

	void reportCommunity(ComplaintVO complaint);

	void updateCommunityWarnYN(int communityNo);

	
	
	int getTotalRecord();

	List<CommunityVO> getCommunityList(PaginationInfoVO<CommunityVO> paginationInfo);

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	int countCommunityList(PaginationInfoVO<CommunityVO> pagingVO);

	List<CommunityVO> communityList(PaginationInfoVO<CommunityVO> pagingVO);

	int countCommunityUserPost(String memId, PaginationInfoVO<CommunityVO> pagingVO);

	List<CommunityVO> communityUserPost(String memId, PaginationInfoVO<CommunityVO> pagingVO);

	PaginationInfoVO<CommunityVO> searchCommunity(PaginationInfoVO<CommunityVO> pagingVO);
}
