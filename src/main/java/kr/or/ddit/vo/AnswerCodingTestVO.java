package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AnswerCodingTestVO {

	private String ansCoteNo;
	private String recCodingTestNo;
	private String applyNo;
	private String ansCoteContent;
	
	// apply
	private ApplyVO applyVO;
	
	// codingTest
	private CodingTestVO codingTestVO;
	private RecruitmentCodingTestVO recruitmentCodingTestVO;
}
