package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BoardVO {

	private int boardNo;
	private String boardTypeCode;
	private String boardTargetCode;
	private String boardTitle;
	private String boardContent;
	private String boardRegDate;
	private String boardUpdDate;
	private String delYn;
}
