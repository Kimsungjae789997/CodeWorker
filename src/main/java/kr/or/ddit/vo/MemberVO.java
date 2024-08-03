package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String memTypeCode;
	private String memId;
	private String memPw;
	private String memName;
	
	private List<MemberAuth> authList;
	
	// 일반회원 정보 
	private SeekerVO seekerVO;
	
	// 기업회원 정보
	private RecruiterVO recruitVO;
	
	// 최종학력 정보
	private EducationVO educationVO;
	
	// 기업회원 계정생성을 위한 crp_id
	private String crpId;
	
	//
	private int rnum;
}
