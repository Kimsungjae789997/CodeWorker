package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ApplicantProcessResultVO {
	
	private int applyNo;
	private String recNtcId;
	private String applicantStatusCode;
	private String testYn;	// 시험응시 or 응시완료  => 시험응시는 기본값

}
