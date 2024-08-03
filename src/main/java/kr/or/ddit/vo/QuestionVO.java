package kr.or.ddit.vo;

import lombok.Data;

@Data
public class QuestionVO {
	
	private int questionNo;
	private String memId;
	private String boardTargetCode;
	private String questionTitle;
	private String questionContent;
	private String questionRegDate;
	private String questionUpdDate;
	private String delYN;
	private String answerYN;
}
