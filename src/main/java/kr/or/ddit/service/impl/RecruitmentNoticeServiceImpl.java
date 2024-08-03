package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;

import kr.or.ddit.mapper.IRecruitmentNoticeMapper;
import kr.or.ddit.service.IRecruitmentNoticeService;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.DetailCodeVO;
import kr.or.ddit.vo.PaginationInfoVO;

import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSelfIntroVO;
import kr.or.ddit.vo.RecruitmentSkillStackVO;

import kr.or.ddit.vo.SeekerVO;
import kr.or.ddit.vo.SelfIntroVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RecruitmentNoticeServiceImpl implements IRecruitmentNoticeService {

	@Inject
	private IRecruitmentNoticeMapper recruitmentNoticeMapper;
	
	
	@Override
	public int selectRecNtcCount(PaginationInfoVO<RecruitmentNoticeVO> pagingVOA) {
		return recruitmentNoticeMapper.selectRecNtcCount(pagingVOA);
	}

	@Override
	public List<RecruitmentNoticeVO> selectRecNtcList(PaginationInfoVO<RecruitmentNoticeVO> pagingVOA) {
		return recruitmentNoticeMapper.selectRecNtcList(pagingVOA);
	}
	// 채용공고 페이지 - 최신 공고 가져오기
	@Override
	public List<RecruitmentNoticeVO> recentRecruitmentSelect() {
		return recruitmentNoticeMapper.recentRecruitmentSelect();
	}
	// 각각의 공고들 정보들 가져오기
	@Override
	public RecruitmentNoticeVO recruitmentNoticeDetail(String recNtcId) {
		recruitmentNoticeMapper.hit(recNtcId);
		return recruitmentNoticeMapper.recruitmentNoticeDetail(recNtcId);
	}
	// 각각의 공고의 기술스택 가져오기
	@Override
	public List<RecruitmentSkillStackVO> getSkill(String recNtcId) {
		return recruitmentNoticeMapper.getSkill(recNtcId);
	}

	@Override
	public SeekerVO selectSeeker(String memId) {
		return recruitmentNoticeMapper.selectSeeker(memId);
	}

	@Override
	public SeekerVO selectSeekerWithResume(String memId) {
		return recruitmentNoticeMapper.selectSeekerWithResume(memId);
	}
	// 공고마다 자기소개 문항서 찾기
	@Override
	public List<RecruitmentSelfIntroVO> selfIntroSelect(String recNtcId) {
		return recruitmentNoticeMapper.selfIntroSelect(recNtcId);
	}
	
	// 지원하기
	@Transactional
	@Override
	public ServiceResult applyResume(ApplyVO applyVO) {
	    ServiceResult result = null;
	    int cnt = 0;
	    
	    // 부모 테이블에 데이터 삽입
	    recruitmentNoticeMapper.applyResume(applyVO);
	    cnt = recruitmentNoticeMapper.insertApplicantProcessResult(applyVO);
	    
	    if (cnt > 0) {
	        log.info("applyVONo ======== : " + applyVO.getApplyNo());
	        
	        for (SelfIntroVO vo : applyVO.getSelfIntroList()) {
	            log.info("  vo.getSelfIntroNo() : " + vo.getSelfIntroNo());
	            log.info(" vo.getSelfIntroText() : " + vo.getSelfIntroText());
	            
	            applyVO.setSelfIntroNo(vo.getSelfIntroNo());
	            applyVO.setSelfIntroText(vo.getSelfIntroText());
	            
	            // 자식 테이블에 데이터 삽입
	            recruitmentNoticeMapper.insertAnswerSelfIntro(applyVO);
	        }
	        
	        result = ServiceResult.OK;
	    } else {
	        result = ServiceResult.FAILED;
	    }
	    
	    return result;
	}

	@Override
	public List<RecruitmentNoticeVO> views(Map<String, Object> map) {
		return recruitmentNoticeMapper.views(map);
	}

	@Override
	public List<String> getRecNtcId(Map<String, Object> skills) {
		return recruitmentNoticeMapper.getRecNtcId(skills);
	}

	@Override
	public List<DetailCodeVO> autoComplete() {
		return recruitmentNoticeMapper.autoComplete();
	}
	

}
