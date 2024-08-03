package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IAdminMapper;
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

@Service
public class AdminServiceImpl implements IAdminService{

	@Inject
	private IAdminMapper mapper;
	
	
	@Override
	public int seekerNum() {
		return mapper.seekerNum();
	}


	@Override
	public int crpNum() {
		return mapper.crpNum();
	}


	@Override
	public int recNtcNum() {
		return mapper.recNtcNum();
	}


	@Override
	public List<BoardVO> adminMainNoticeList(Map<String, String> params) {
		return mapper.adminMainNoticeList(params);
	}


	@Override
	public List<QuestionVO> adminMainQuestionList() {
		return mapper.adminMainQuestionList();
	}


	@Override
	public List<JoinReqCrpVO> adminMainRequestJoinCrpList() {
		return mapper.adminMainRequestJoinCrpList();
	}
	
	@Override
	public List<CommunityVO> adminCommunityMainList() {
		return mapper.adminCommunityMainList();
	}
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
//	@Override
//	public List<SeekerVO> seekerList() {
//		return mapper.seekerList();
//	}


	@Override
	public SeekerVO seekerDetail(SeekerVO seekerDetail) {
		return mapper.seekerDetail(seekerDetail);
	}


	@Override
	public void updateSeeker(SeekerVO seeker) {
		mapper.seekerUpdate(seeker);
	}

	@Override
	public void seekerRemove(SeekerVO seeker) {
		mapper.seekerRemove(seeker);
	}

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
//	@Override
//	public List<RecruiterVO> recruiterList() {
//		return mapper.recruiterList();
//	}


	@Override
	public Map<Object, String> recruiterDetail(String memId) {
		return mapper.recruiterDetail(memId);
	}


	@Override
	public void updateRecruiter(RecruiterVO recruiter) {
		mapper.recruiterUpdate(recruiter);
	}


	//,, 구인회원탈퇴처리
	@Override
	public void recruiterRemove(RecruiterVO recruiter) {
		mapper.recruiterRemove(recruiter);
	}
	//,,

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//

	
//	@Override
//	public List<CorporationVO> crpList() {
//		return mapper.crpList();
//	}


	@Override
	public CorporationVO crpDetail(CorporationVO crpDetail) {
		return mapper.crpDetail(crpDetail);
	}


	@Override
	public void crpUpdate(CorporationVO crp) {
		mapper.crpUpdate(crp);
		
	}
	
	@Override
	public void crpRemove(CorporationVO crp) {
		mapper.crpRemove(crp);
	}


	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
//	@Override
//	public List<JoinReqCrpVO> jrCrpList() {
//		return mapper.jrCrpList();
//	}


	@Override
	public JoinReqCrpVO jrCrpDetail(JoinReqCrpVO jrCrp) {
		return mapper.jrCrpDetail(jrCrp);
	}


	//★
	@Override
	public void jrCrpUpdate(JoinReqCrpVO joinReqCrpVO) {
		
		mapper.jrCrpUpdate(joinReqCrpVO);
		
		if ("Y".equals(joinReqCrpVO.getJoReqStatus())) {
            mapper.jrCrpInsert(joinReqCrpVO.getJoReqCrpId());
        }
	}

	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	

//	@Override
//	public List<CommunityVO> communityList() {
//		return mapper.communityList();
//	}

	@Override
	public List<CommunityVO> communitySortRecent() {
		return mapper.communitySortRecent();
	}
	
	
	@Override
	public Map<String, Object> communityDetail(int communityNo) {
		return mapper.communityDetail(communityNo);
	}


	@Override
	public List<Map<String, Object>> communityReply(int communityNo) {
		return mapper.communityReply(communityNo);
	}


	@Override
	public void communityUpdate(CommunityVO community) {
		mapper.communityUpdate(community);
	}


	@Override
	public void replyUpdate(CommunityReplyVO reply) {
		mapper.replyUpdate(reply);
	}


	@Override
	public void communityRemove(CommunityVO community) {
		mapper.communityRemove(community);
	}


	@Override
	public void replyRemove(CommunityReplyVO reply) {
		mapper.replyRemove(reply);
	}


	//,, 신고 내역
	@Override
	public ComplaintVO complaintDetail(ComplaintVO complaintDetail) {
		return mapper.complaintDetail(complaintDetail);
	}

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
//	@Override
//	public List<BoardVO> noticeList(Map<String, String> params) {
//		return mapper.noticeList(params);
//	}
	

	@Override
	public BoardVO noticeDetail(int boardNo) {
		return mapper.noticeDetail(boardNo);
	}


	@Override
	public void noticeUpdate(BoardVO board) {
		mapper.noticeUpdate(board);
	}


	@Override
	public void noticeRemove(BoardVO board) {
		mapper.noticeRemove(board);
	}


	@Override
	public int noticeInsert(BoardVO board) {
		return mapper.noticeInsert(board);
	}


	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	
//	@Override
//	public List<QuestionVO> questionList() {
//		return mapper.questionList();
//	}


	@Override
	public QuestionVO questionDetail(int questionNo) {
		return mapper.questionDetail(questionNo);
	}


	@Override
	public void answerQuestion(QuestionReplyVO reply) {
		
		try {
			mapper.insertQuestionReply(reply);
			mapper.updateQuestionAnswerStatus(reply.getQuestionNo());
		} catch (Exception e) {
			throw new RuntimeException("답변 등록 오류 발생");
		}
	}


	@Override
	public QuestionReplyVO answerDetail(int questionNo) {
		return mapper.answerDetail(questionNo);
	}


	//통계(북마크순 - 좋아요 깃발 공고)
	@Override
	public List<Map<String, Object>> bookMarkList() {
		return this.mapper.bookMarkList();
	}
	
	//통계(북마크순 - 좋아요 깃발 공고)
	@Override
	public List<Map<String, Object>> bookMarkList2() {
		return this.mapper.bookMarkList2();
	}
	
	//통계(북마크순 - 좋아요 깃발 공고)
	@Override
	public List<Map<String, Object>> bookMarkList3() {
		return this.mapper.bookMarkList3();
	}
	
	//통계(북마크순 - 좋아요 깃발 공고)
	@Override
	public List<Map<String, Object>> bookMarkList4() {
		return this.mapper.bookMarkList4();
	}


	@Override
	public int countNoticeList(PaginationInfoVO<BoardVO> pagingVO) {
		return mapper.countNoticeList(pagingVO);
	}


	@Override
	public List<BoardVO> noticeList(PaginationInfoVO<BoardVO> pagingVO) {
		return mapper.noticeList(pagingVO);
	}


	@Override
	public List<SeekerVO> seekerList(PaginationInfoVO<SeekerVO> pagingVO) {
		return mapper.seekerList(pagingVO);
	}


	@Override
	public int countSeekerList(PaginationInfoVO<SeekerVO> pagingVO) {
		return mapper.countSeekerList(pagingVO);
	}


	@Override
	public int countRecruiterList(PaginationInfoVO<RecruiterVO> pagingVO) {
		return mapper.countRecruiterList(pagingVO);
	}


	@Override
	public List<RecruiterVO> recruiterList(PaginationInfoVO<RecruiterVO> pagingVO) {
		return mapper.recruiterList(pagingVO);
	}


	@Override
	public int countCrpList(PaginationInfoVO<CorporationVO> pagingVO) {
		return mapper.countCrpList(pagingVO);
	}


	@Override
	public List<CorporationVO> crpList(PaginationInfoVO<CorporationVO> pagingVO) {
		return mapper.crpList(pagingVO);
	}


	@Override
	public int countjrCrpList(PaginationInfoVO<JoinReqCrpVO> pagingVO) {
		return mapper.countjrCrpList(pagingVO);
	}


	@Override
	public List<JoinReqCrpVO> jrCrpList(PaginationInfoVO<JoinReqCrpVO> pagingVO) {
		return mapper.jrCrpList(pagingVO);
	}


	@Override
	public int countCommunityList(PaginationInfoVO<CommunityVO> pagingVO) {
		return mapper.countCommunityList(pagingVO);
	}


	@Override
	public List<CommunityVO> communityList(PaginationInfoVO<CommunityVO> pagingVO) {
		return mapper.communityList(pagingVO);
	}


	@Override
	public int countQuestionList(PaginationInfoVO<QuestionVO> pagingVO) {
		return mapper.countQuestionList(pagingVO);
	}


	@Override
	public List<QuestionVO> questionList(PaginationInfoVO<QuestionVO> pagingVO) {
		return mapper.questionList(pagingVO);
	}




	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//

//	@Override
//	public int countNoticeList(Map<String, String> params) {
//		return mapper.countNoticeList(params);
//	}

}
