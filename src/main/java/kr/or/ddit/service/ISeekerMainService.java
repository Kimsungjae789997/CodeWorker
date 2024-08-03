package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.InterestCorporationVO;
import kr.or.ddit.vo.InterestRecNtcVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;

public interface ISeekerMainService {
	//  자동 검색어 완성 기능
	public List<CorporationVO> autoComplete();
	// 최신 공고 순 가져오기
	public List<RecruitmentNoticeVO> recentRecruitmentSelect();
	// 자신의 지역 공고 (회원)
	public List<RecruitmentNoticeVO> locationRecruitmentSelect(String memId);
	// 회원의 지역 가져오기
	public String locationSelect(String memId);
	// seeker header 프로필 이미지 찾기
	public String profileSearch(String memId);
	// 북마크 넣기
	public void bookmarkInsert(InterestRecNtcVO recntcVO);
	// 북마크 select하기
	public InterestRecNtcVO bookmarkSelect(InterestRecNtcVO recntcVO);
	// 기업 정보 가져오기
	public CorporationVO crpSelect(String crpId);
	// 각기업이 속한 채용공고 가져오기
	public List<RecruitmentNoticeVO> recruitmentAllSelect(String crpId);
	// 채용공고 수 가져오기
	public int recruitmentCount(String crpId);
	// 관심회사   select하기
	public InterestCorporationVO interestCrpSelect(InterestCorporationVO corVO);
	// 관심회사 등록하기
	public void interestCrp(InterestCorporationVO corVO);
	// 관심회사 전체 수
	public int selectInterestCrpCount(InterestCorporationVO corVO);
	// 최근 본공고 등록
	public ServiceResult addRecentView(Map<String, Object> map);
	
	public List<RecruitmentNoticeVO> recViewSelect(String memId);

	


}
