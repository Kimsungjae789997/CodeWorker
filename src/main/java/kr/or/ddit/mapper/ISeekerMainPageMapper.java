package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.InterestCorporationVO;
import kr.or.ddit.vo.InterestRecNtcVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;

public interface ISeekerMainPageMapper {

	// 자동완성 기능 - 검색어
	public List<CorporationVO> autoComplete();
	// 채용공고 최신순
	public List<RecruitmentNoticeVO> recentRecruitmentSelect();
	// 자신의 지역 공고 (회원)
	public List<RecruitmentNoticeVO> locationRecruitmentSelect(String memId);
	// 자신의 지역명 가져오기
	public String locationSelect(String memId);
	// seeker header 프로필 이미지 찾기
	public String profileSearch(String memId);
	// 북마크가 첫등록인지 아닌지 유무확인
	public InterestRecNtcVO checkInterestRecNtc(InterestRecNtcVO recntcVO);
	// 북마크 처음으로 등록할때 이거 이용
	public void boomarkInsert(InterestRecNtcVO recntcVO);
	// 북마크 두번째 이상부터는 이걸 이용함
	public void bookmarkUpdate(InterestRecNtcVO recntcVO);
	// 북마크 select하기
	public InterestRecNtcVO boomarkSelect(InterestRecNtcVO recntcVO);
	// 기업정보 가져오기
	public CorporationVO crpSelect(String crpId);
	// 각기업이 속한 채용공고 가져오기
	public List<RecruitmentNoticeVO> recruitmentAllSelect(String crpId);
	// 채용공고 수 가져오기
	public int recruitmentCount(String crpId);
	// 관심회사   select하기
	public InterestCorporationVO interestCrpSelect(InterestCorporationVO corVO);
	// 관심회사가 첫등록인지 아닌지 유무확인
	public InterestCorporationVO checkInterestCor(InterestCorporationVO corVO);
	// 관심회사가 두번째 이상부터는 이걸 이용함
	public void intCorUpdate(InterestCorporationVO intCorVO);
	// 관심회사가 처음으로 등록할때 이거 이용
	public void intCorInsert(InterestCorporationVO corVO);
	// 관심회사 전체 수
	public int selectInterestCrpCount(InterestCorporationVO corVO);
	// 최근 본공고 등록
	public int addRecentView(Map<String, Object> map);
	
	public List<RecruitmentNoticeVO> recViewSelect(String memId);
	


}
