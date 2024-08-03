package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IApplicantMgmtMapper;
import kr.or.ddit.service.IApplicantMgmtService;
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

@Service
public class ApplicantMgmtServiceImpl implements IApplicantMgmtService {
	
	@Inject
	private IApplicantMgmtMapper applicantMgmt;
	
	@Override
	public int selectApplyCount(PaginationInfoVO<ApplyVO> pagingVO) {
		return applicantMgmt.selectApplyCount(pagingVO);
	}

	@Override
	public List<ApplyVO> selectApplyList(PaginationInfoVO<ApplyVO> pagingVO) {
		return applicantMgmt.selectApplyList(pagingVO);
	}

	@Override
	public List<RecruitmentNoticeVO> getRecNtcList(String corpId) {
		return applicantMgmt.getRecNtcList(corpId);
	}
	

	@Override
	public ResumeVO getResumeByNo(int resumeNo) {
		return applicantMgmt.getResumeByNo(resumeNo);
	}

	@Override
	public ResumeVO basicResume(int resumeNo) {
		return applicantMgmt.basicResume(resumeNo);
	}

	@Override
	public List<CertificationVO> certificationForResume(int resumeNo) {
		return applicantMgmt.certificationForResume(resumeNo);
	}

	@Override
	public List<ResumeSkillVO> skillForResume(int resumeNo) {
		return applicantMgmt.skillForResume(resumeNo);
	}

	@Override
	public List<ResumeCareerVO> careerForResume(int resumeNo) {
		return applicantMgmt.careerForResume(resumeNo);
	}

	@Override
	public List<AnswerSelfIntroVO> selfInfoAnswer(int applyNo) {
		return applicantMgmt.selfInfoAnswer(applyNo);
	}
	
	@Override
	public List<AnswerCodingTestVO> codingTestAnswer(int applyNo) {
		return applicantMgmt.codingTestAnswer(applyNo);
	}

	@Override
	public ServiceResult updateApplicantStatus(int applyNo) {
		ServiceResult result = null;
		int cnt = applicantMgmt.updateApplicantStatus(applyNo);
		if (cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public ServiceResult updateApplicantNonPass(int applyNo) {
		ServiceResult result = null;
		int cnt = applicantMgmt.updateApplicantNonPass(applyNo);
		if (cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public String getMemid(int applyNo) {
		return applicantMgmt.getMemId(applyNo);
	}

	@Override
	public void insertAlarm(AlarmVO alarmVO) {
		if(alarmVO.getStatus().equals("APP0101")) {
			alarmVO.setAlarmType("01");
			alarmVO.setAlarmContent("지원하신 채용의 서류 전형 결과가 나왔습니다.");
			applicantMgmt.insertAlarm(alarmVO);
		}
		if(alarmVO.getStatus().equals("APP0102")) {
			alarmVO.setAlarmType("02");
			alarmVO.setAlarmContent("지원하신 채용의 코딩테스트 결과가 나왔습니다.");
			applicantMgmt.insertAlarm(alarmVO);
		}
		if(alarmVO.getStatus().equals("APP0103")) {
			alarmVO.setAlarmType("03");
			alarmVO.setAlarmContent("지원하신 채용의 면접 전형 결과가 나왔습니다.");
			applicantMgmt.insertAlarm(alarmVO);
		}
		if(alarmVO.getStatus().equals("APP0105")) {
			alarmVO.setAlarmType("04");
			alarmVO.setAlarmContent("채용 결과가 나왔습니다.");
			applicantMgmt.insertAlarm(alarmVO);
		}
		if(alarmVO.getStatus().equals("PROPOSAL")) {
			alarmVO.setAlarmType("05");
			alarmVO.setAlarmContent("인재 제안을 받았습니다.");
			applicantMgmt.insertAlarm2(alarmVO);
		}

		
	}

	@Override
	public String getStatus(int applyNo) {
		return applicantMgmt.getStatus(applyNo);
	}

	@Override
	public String getMemId2(int proNo) {
		return applicantMgmt.getMemId2(proNo);
	}

	
	
}


