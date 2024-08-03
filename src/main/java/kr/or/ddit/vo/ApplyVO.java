package kr.or.ddit.vo;


import java.util.List;

import lombok.Data;

@Data
public class ApplyVO {
	
	private int applyNo;
	private String memId;
	private String recNtcId;
	private String resumeNo;
	private String applyDate;
	private String applyUpdDate;
	
	// VO로 회원정보 넣기
	private SeekerVO seekerVO;
	private EducationVO educationVO;
	private ResumeVO resumeVO;
	private ApplicantProcessResultVO applyProcessResultVO;
	
	
	// 공고 이름 불러오기 위해 사용
	private RecruitmentNoticeVO recruitmentNoticeVO;
	
	private int rnum;
	
	//  - 지원현황표 만들때 가져오는곳
	private String crpName;
	private String applicantStatusCode;
	private String positionCode;
	private String recNtcTitle;
	
	// 통계
	private String eduMajor;
	private String applyCount;
	private String eduType;
	
	private String testYn;
	
	// 자기소개서 문항 답변 arr에 담음
	private List<SelfIntroVO> selfIntroList;
	
	private int ansIntroNo;
	private int selfIntroNo;
	private String selfIntroText;
	
	private String intvwDate;
}
