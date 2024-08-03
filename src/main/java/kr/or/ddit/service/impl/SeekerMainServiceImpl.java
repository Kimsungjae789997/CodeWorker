package kr.or.ddit.service.impl;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ISeekerMainPageMapper;
import kr.or.ddit.service.ISeekerMainService;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.InterestCorporationVO;
import kr.or.ddit.vo.InterestRecNtcVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SeekerMainServiceImpl implements ISeekerMainService {

	@Inject
	private ISeekerMainPageMapper seekerMainPage;

	@Override
	public List<CorporationVO> autoComplete() {
		return seekerMainPage.autoComplete();
	}

	@Override
	public List<RecruitmentNoticeVO> recentRecruitmentSelect() {
		return seekerMainPage.recentRecruitmentSelect();
	}

	@Override
	public List<RecruitmentNoticeVO> locationRecruitmentSelect(String memId) {
		return seekerMainPage.locationRecruitmentSelect(memId);
	}

	@Override
	public String locationSelect(String memId) {
		return seekerMainPage.locationSelect(memId);
	}

	@Override
	public String profileSearch(String memId) {
		return seekerMainPage.profileSearch(memId);
	}

	@Override
	public void bookmarkInsert(InterestRecNtcVO recntcVO) {
		InterestRecNtcVO rec = seekerMainPage.checkInterestRecNtc(recntcVO);
		log.info("rec============================== :" + rec);
		if(rec != null) {	// 있으니 update
			seekerMainPage.bookmarkUpdate(rec);
		}else {	// 첫북마크 등록이니 insert
			seekerMainPage.boomarkInsert(recntcVO);
		}
		
	}

	@Override
	public InterestRecNtcVO bookmarkSelect(InterestRecNtcVO recntcVO) {
		return seekerMainPage.boomarkSelect(recntcVO);
	}
	
	// 기업정보 가져오기
	@Override
	public CorporationVO crpSelect(String crpId) {
		return seekerMainPage.crpSelect(crpId);
	}

	@Override
	public List<RecruitmentNoticeVO> recruitmentAllSelect(String crpId) {
		return seekerMainPage.recruitmentAllSelect(crpId);
	}
	// 채용공고 수 가져오기
	@Override
	public int recruitmentCount(String crpId) {
		return seekerMainPage.recruitmentCount(crpId);
	}
	// 관심회사   select하기
	@Override
	public InterestCorporationVO interestCrpSelect(InterestCorporationVO corVO) {
		return seekerMainPage.interestCrpSelect(corVO);
	}
	// 관심회사 등록하기
	@Override
	public void interestCrp(InterestCorporationVO corVO) {
		InterestCorporationVO intCorVO = seekerMainPage.checkInterestCor(corVO);
		log.info("cor============================== :" + intCorVO);
		if(intCorVO != null) {	// 있으니 update
			seekerMainPage.intCorUpdate(intCorVO);
		}else {	// 첫북마크 등록이니 insert
			seekerMainPage.intCorInsert(corVO);
		}
		
	}
	// 관심회사 전체 수
	@Override
	public int selectInterestCrpCount(InterestCorporationVO corVO) {
		return seekerMainPage.selectInterestCrpCount(corVO);
	}
	// 최근 본공고 등록
	@Override
	public ServiceResult addRecentView(Map<String, Object> map) {
		ServiceResult result = null;
		int cnt = 0;
		cnt = seekerMainPage.addRecentView(map);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<RecruitmentNoticeVO> recViewSelect(String memId) {
		return seekerMainPage.recViewSelect(memId);
	}



	


}
