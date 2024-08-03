package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AnswerSelfIntroVO {
	
	private String ansIntroNo;
	private String applyNo;
	private String ansIntroContent;
	private String selfIntroNo;
	
	// apply
	private ApplyVO applyVO;
	
	// recruiter_self_intro
	private RecruitmentSelfIntroVO recruitmentSelfIntroVO;
	

}
