package kr.or.ddit.vo;

import lombok.Data;

@Data
public class QuestionReplyVO {

	private int questionReplyNo;
	private int questionNo;
	private String questionReplyContent;
	private String questionReplyRegDate;
	private String questionReplyDelYN;
}
