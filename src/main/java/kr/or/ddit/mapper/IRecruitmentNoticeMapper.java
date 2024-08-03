package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.DetailCodeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSelfIntroVO;
import kr.or.ddit.vo.RecruitmentSkillStackVO;

import kr.or.ddit.vo.SeekerVO;

public interface IRecruitmentNoticeMapper {

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
	public void applyResume(ApplyVO applyVO);
	// 지원자 채용과정결과 insert하기
	public int insertApplicantProcessResult(ApplyVO applyVO);
	// 자기소개문항답변 넣기
	public void insertAnswerSelfIntro(ApplyVO applyVO);
	public void hit(String recNtcId);
	public List<RecruitmentNoticeVO> views(Map<String, Object> map);
	public List<String> getRecNtcId(Map<String, Object> skills);
	public List<DetailCodeVO> autoComplete();




}
