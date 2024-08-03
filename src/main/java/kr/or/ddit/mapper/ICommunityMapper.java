package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CommunityReplyVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.ComplaintVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface ICommunityMapper {

	//List<CommunityVO> communityMainList();

	Map<String, Object> communityMainDetail(int communityNo);

	void incrementCommunityHit(int communityNo);

	List<Map<String, Object>> communityMainReply(int communityNo);

	//,,List<CommunityVO> searchByTitle(String searchKeyword);

	//,,List<CommunityVO> searchByAuthor(String searchKeyword);

	int communityInsert(CommunityVO community);

	List<CommunityVO> communitySortRecent();

	List<CommunityVO> communitySortViews();

	List<CommunityVO> communitySortMyPost(@Param("memId") String memId);

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

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	int getTotalRecord();

	List<CommunityVO> getCommunityList(PaginationInfoVO<CommunityVO> paginationInfo);

	int countCommunityList(PaginationInfoVO<CommunityVO> pagingVO);

	List<CommunityVO> communityList(PaginationInfoVO<CommunityVO> pagingVO);

	int countCommunityUserPost(@Param("memId") String memId, @Param("pagingVO") PaginationInfoVO<CommunityVO> pagingVO);

	List<CommunityVO> communityUserPost(@Param("memId") String memId, @Param("pagingVO") PaginationInfoVO<CommunityVO> pagingVO);

	int getSearchCount(PaginationInfoVO<CommunityVO> pagingVO);

	List<CommunityVO> searchCommunity(PaginationInfoVO<CommunityVO> pagingVO);
}
