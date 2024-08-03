package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

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

public interface IAdminMapper {

	int seekerNum();

	int crpNum();

	int recNtcNum();

	List<BoardVO> adminMainNoticeList(Map<String, String> params);

	List<QuestionVO> adminMainQuestionList();

	List<JoinReqCrpVO> adminMainRequestJoinCrpList();
	
	List<CommunityVO> adminCommunityMainList();
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	//List<SeekerVO> seekerList();

	SeekerVO seekerDetail(SeekerVO seekerDetail);
	
	void seekerUpdate(SeekerVO seeker);

	void seekerRemove(SeekerVO seeker);

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	//List<RecruiterVO> recruiterList();

	Map<Object, String> recruiterDetail(String memId);

	void recruiterUpdate(RecruiterVO recruiter);

	void recruiterRemove(RecruiterVO recruiter);

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	//List<CorporationVO> crpList();

	CorporationVO crpDetail(CorporationVO crpDetail);

	void crpUpdate(CorporationVO crp);
	
	void crpRemove(CorporationVO crp);

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	//List<JoinReqCrpVO> jrCrpList();

	JoinReqCrpVO jrCrpDetail(JoinReqCrpVO jrCrp);

	void jrCrpUpdate(JoinReqCrpVO joinReqCrpVO);
	
	//★
	void jrCrpInsert(String crpId);
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //

	//List<CommunityVO> communityList();
	
	List<CommunityVO> communitySortRecent();

	Map<String, Object> communityDetail(int communityNo);

	List<Map<String, Object>> communityReply(int communityNo);

	void communityUpdate(CommunityVO community);

	void replyUpdate(CommunityReplyVO reply);

	void communityRemove(CommunityVO community);

	void replyRemove(CommunityReplyVO reply);

	//,, 신고 내역
	ComplaintVO complaintDetail(ComplaintVO complaintDetail);

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //

	//List<BoardVO> noticeList(Map<String, String> params);
	
	BoardVO noticeDetail(int boardNo);

	void noticeUpdate(BoardVO board);

	void noticeRemove(BoardVO board);

	int noticeInsert(BoardVO board);

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	
	//List<QuestionVO> questionList();

	QuestionVO questionDetail(int questionNo);

	void insertQuestionReply(QuestionReplyVO reply);

	void updateQuestionAnswerStatus(int questionNo);

	QuestionReplyVO answerDetail(int questionNo);

	//통계(북마크순 - 좋아요 깃발 공고)
	List<Map<String, Object>> bookMarkList();
	
	//통계(북마크순 - 좋아요 깃발 공고)
	List<Map<String, Object>> bookMarkList2();
	
	//통계(북마크순 - 좋아요 깃발 공고)
	List<Map<String, Object>> bookMarkList3();
	
	//통계(북마크순 - 좋아요 깃발 공고)
	List<Map<String, Object>> bookMarkList4();
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //

	int countNoticeList(PaginationInfoVO<BoardVO> pagingVO);

	List<BoardVO> noticeList(PaginationInfoVO<BoardVO> pagingVO);

	List<SeekerVO> seekerList(PaginationInfoVO<SeekerVO> pagingVO);

	int countSeekerList(PaginationInfoVO<SeekerVO> pagingVO);

	int countRecruiterList(PaginationInfoVO<RecruiterVO> pagingVO);

	List<RecruiterVO> recruiterList(PaginationInfoVO<RecruiterVO> pagingVO);

	int countCrpList(PaginationInfoVO<CorporationVO> pagingVO);

	List<CorporationVO> crpList(PaginationInfoVO<CorporationVO> pagingVO);

	int countjrCrpList(PaginationInfoVO<JoinReqCrpVO> pagingVO);

	List<JoinReqCrpVO> jrCrpList(PaginationInfoVO<JoinReqCrpVO> pagingVO);

	int countCommunityList(PaginationInfoVO<CommunityVO> pagingVO);

	List<CommunityVO> communityList(PaginationInfoVO<CommunityVO> pagingVO);

	int countQuestionList(PaginationInfoVO<QuestionVO> pagingVO);

	List<QuestionVO> questionList(PaginationInfoVO<QuestionVO> pagingVO);

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ //
	//int countNoticeList(Map<String, String> params);

}
