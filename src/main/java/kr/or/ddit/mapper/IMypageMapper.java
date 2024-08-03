package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AnswerCodingTestVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.CodingTestVO;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitmentCodingTestVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;

public interface IMypageMapper {

	// 마이페이지에서 일반회원 정보들 가져오기
	public SeekerVO seekerMypageSelect(String memId);
	// 프로필
	public SeekerVO seekerProfileSelect(String memId);
	// 최종학력 select
	public EducationVO seekerEduSelect(String memId);
	// 설정- memName update
	public void profileMemNameUpdate(MemberVO memberVO);
	// memId의 유무에 따라서 update,insert 가 나눠짐
	public int checkMemIdExists(String memId);
	public void educationInsert(EducationVO educationVO);	
	public void educationUpdate(EducationVO educationVO);
	
	public int profileUpdate(SeekerVO seekerVO);
	
	public Map<String, Integer> allCountSelect(String memId);
	//  마이페이지에서 지원현황 지원완료애들 정보가져오기 
	public List<ApplyVO> applySuccess(String memId);
	// 지원현황 총 수 구하기
	public int getCount1(String memId);
	public int getCount2(String memId);
	public int getCount3(String memId);
	public int getCount4(String memId);
	public int getCount5(String memId);
	// 마이페이지에서 서류통과애들 가져오기
	public List<ApplyVO> documentSuccess(String memId);
	// 마이페이지에서 코딩테스트통과 정보 가져오기
	public List<ApplyVO> coteSuccess(String memId);
	// 마이페이지에서 최종합격 정보 가져오기
	public List<ApplyVO> finalApplySuccess(String memId);
	// 마이페이지에서 불합격 정보 가져오기	
	public List<ApplyVO> failApplySuccess(String memId);
	// 각 문항에 대한 문항번호를 가져온다.
	public List<RecruitmentCodingTestVO> coteNoSelect(String recNtcId);
	public CodingTestVO getCoteInfo(int coteNo);
	public RecruitmentNoticeVO selectRecNtc(String recNtcId);
	// 공고별 코딩테스트 문항 구하기 <= 코딩테스트VO에서 coteNo와 recNtcId가 필요
	public int getRecCoteNo(Map<String, Object> map);
	// 지원번호를 구한다.
	public int getApplyNo(Map<String, Object> map);
	
	public int coteInsert(Map<String, Object> map);
	public AnswerCodingTestVO selectAnswerCodingTest(Map<String, Object> map);
	public int coteUpdate(Map<String, Object> map);
	// 시험응시 -> 응시완료 바꾸기
	public int updateTestStatus(Map<String, Object> map);
	public List<RecruitmentNoticeVO> bookMarkAll(String memId);
	public List<CorporationVO> goInterestCrpAll(String memId);
	public int getRecCount(String memId);
	public List<CorporationVO> goProposalAll(String memId);
	public int proposalAccept(int proNo);
	public int proposalDeny(int proNo);


	

}
