package kr.or.ddit.mapper;

import java.util.List;

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

public interface IApplicantMgmtMapper {

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
	public int updateApplicantStatus(int applyNo);
	public int updateApplicantNonPass(int applyNo);
	public String getMemId(int applyNo);
	public void insertAlarm(AlarmVO alarmVO);
	public String getStatus(int applyNo);
	public void insertAlarm2(AlarmVO alarmVO);
	public String getMemId2(int proNo);

}
