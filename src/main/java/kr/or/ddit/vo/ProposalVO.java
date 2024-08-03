package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ProposalVO {

	private int proNo;
	private String crpId;
	private String recuriterId;
	private String recNtcId;
	private String recNtcTitle;
	private String memId;
	private String proDate; // 제안일
	private String proReplyStatusCode; 

	private int rnum;
	private String seekerEmail;
	private String seekerName;
	private String seekerExp;
    private String eduType;
    private String eduName;
    private String eduMajor;
    private String resumeName;
    private int resumeNo;
    private String proReplyStatus;
	
	// 여기 안에  SEEKER, EDUCATION, RESUME 넣기
	private SeekerVO seekerInfo;
	private EducationVO seekerEduInfo;
	private ResumeVO resumeInfo;
	private RecruitmentNoticeVO recruitmentNoticeInfo;
	
	
	
}