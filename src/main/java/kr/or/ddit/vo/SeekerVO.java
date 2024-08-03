package kr.or.ddit.vo;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SeekerVO {

	private String memId;
	private String seekerName;
	private String seekerBirth;
	private String seekerZip;
	private String seekerAdd1;
	private String seekerAdd2;
	private String seekerEmail;
	private String seekerTel;
	private String seekerJoinDate;
	private String seekerStatusCode;
	private String seekerProfileUrl;
	private String seekerExp;
	private String seekerDelYN;
	private String seekerExpYearsCode;
	private String seekerModifyYn = "N";
	// 파일 업로드
	private MultipartFile imgFile;
	
	// proposal을 위한 필드
	private ResumeVO resumeVO;
	private EducationVO educationVO;
	private int seekerAge; 
	private String eduType;
	private ResumeCareerVO resumeCareerVO;
	private String careerTotalDuration;
	
	private List<ResumeSkillVO> resumeSkillList;
	
	
	
	// 지원하기 버튼 이력서 내용
	private String resumeName;
	private String resumeYn;
	private String selectedDate;
	private int resumeNo;
	
    // 이력서 리스트
    private List<ResumeVO> resumeList;
}
