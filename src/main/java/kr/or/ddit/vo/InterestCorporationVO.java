package kr.or.ddit.vo;

import lombok.Data;

@Data
public class InterestCorporationVO {

	 private String crpId;
	 private String memId;
	 private String intDate;
	 private String interestYn;
	 
	 // 기업회원마다 관심을 가진 구직자 수
	 private int count;
}
