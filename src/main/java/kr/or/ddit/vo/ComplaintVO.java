package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ComplaintVO {

	private int complaintNo;
	private int communityNo;
	private String memId;
	private String complaintReason;
	private String complaintContent;
	
}
