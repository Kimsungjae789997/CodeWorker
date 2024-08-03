package kr.or.ddit.vo;


import lombok.Data;

@Data
public class CommunityVO {
	private int communityNo;
	private String memId;
	private String communityTitle;
	private String communityContent;
	private String communityRegDate;
	private String communityUpdDate;
	private int communityHit;
	private String communityDelYN;
	private String nonBlocked;
	private String communityWarnYN; // << 요거 추가(신고받은 게시글인지 판단 Y/N)
	
	private int replyCount; // << 커뮤니티 메인페이지에서 게시글 제목 옆에 댓글숫자 띄우려고 ( ex) TEST제목입니다(5) )
}
