package kr.or.ddit.vo;


import lombok.Data;

@Data
public class CommunityReplyVO {
	private int commReplyNo;
	private int communityNo;
	private String memId;
	private String commReplyContent;
	private String commReplyRegDate;
	private String commReplyDelYN;
	private Integer parentReplyNo;
}

