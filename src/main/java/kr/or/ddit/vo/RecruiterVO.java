package kr.or.ddit.vo;


import lombok.Data;

@Data
public class RecruiterVO {

	private String memId;
	private String crpId;
	private String rcrtTel;
	private String rcrtPosition;
	private String rcrtJoinDate;
	private String rcrtEmail;
	private String rcrtProfileUrl;
	private String enabled;
	private String rcrtDelYN;
	
	private String crpName;
	private String memName;
	
	// 기업 정보 가져오기
	private CorporationVO corporationVO;
	
	private MemberVO memberVO;
}
