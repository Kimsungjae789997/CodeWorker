package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BlacklistVO {
	
	private int blacklistNo;
	private String blacklistDate;
	private String blacklistContent;
	private String memId;
}
