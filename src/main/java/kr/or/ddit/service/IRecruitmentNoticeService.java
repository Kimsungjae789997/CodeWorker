package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.DetailCodeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSelfIntroVO;
import kr.or.ddit.vo.RecruitmentSkillStackVO;
import kr.or.ddit.vo.SeekerVO;

public interface IRecruitmentNoticeService {

	public int selectRecNtcCount(PaginationInfoVO<RecruitmentNoticeVO> pagingVOA);
	public List<RecruitmentNoticeVO> selectRecNtcList(PaginationInfoVO<RecruitmentNoticeVO> pagingVOA);
	// 채용공고 페이지 - 최신 공고 가져오기
	public List<RecruitmentNoticeVO> recentRecruitmentSelect();
	// 각각의 공고들 정보들 가져오기
	public RecruitmentNoticeVO recruitmentNoticeDetail(String recNtcId);
	// 각각의 공고의 기술스택 가져오기
	public List<RecruitmentSkillStackVO> getSkill(String recNtcId);
	public SeekerVO selectSeeker(String memId);
	public SeekerVO selectSeekerWithResume(String memId);
	// 공고마다 자기소개 문항서 찾기
	public List<RecruitmentSelfIntroVO> selfIntroSelect(String recNtcId);
	// 지원하기
	public ServiceResult applyResume(ApplyVO applyVO);
	public List<RecruitmentNoticeVO> views(Map<String, Object> map);
	public List<String> getRecNtcId(Map<String, Object> map);
	public List<DetailCodeVO> autoComplete();
	 
}
