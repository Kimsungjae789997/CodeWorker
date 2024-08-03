package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AnswerCodingTestVO;
import kr.or.ddit.vo.AnswerSelfIntroVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.CertificationVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.ResumeVO;

public interface IApplicantMgmtService {

	public int selectApplyCount(PaginationInfoVO<ApplyVO> pagingVO);
	public List<ApplyVO> selectApplyList(PaginationInfoVO<ApplyVO> pagingVO);
	
	public List<RecruitmentNoticeVO> getRecNtcList(String corpId);
	public ResumeVO getResumeByNo(int resumeNo);
	public ResumeVO basicResume(int resumeNo);
	public List<CertificationVO> certificationForResume(int resumeNo);
	public List<ResumeSkillVO> skillForResume(int resumeNo);
	public List<ResumeCareerVO> careerForResume(int resumeNo);
	public List<AnswerSelfIntroVO> selfInfoAnswer(int applyNo);
	public List<AnswerCodingTestVO> codingTestAnswer(int applyNo);
	public ServiceResult updateApplicantStatus(int applyNo);
	public ServiceResult updateApplicantNonPass(int applyNo);
	public String getMemid(int applyNo);
	public void insertAlarm(AlarmVO alarmVO);
	public String getStatus(int applyNo);
	public String getMemId2(int proNo);

}
