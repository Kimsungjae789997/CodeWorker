package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ResumeVO {

	private int resumeNo;
	private String memId;
	private String resumeYn;
	private String resumeName;
	//파일명 : resultProfile.getOriginalFileName()
	private String resumeProfileUrl;
	private MultipartFile resumeProfile;
	
	private String resumeIntroduction;
	private String resumeRegDate;
	private String resumeUpdDate;
	private String delYn;
	private String eduType;
	
	// seeker
	private SeekerVO seekerVO;
	
	// educaiton
	private EducationVO educationVO;

	private String selectedDate;
	
	// 회원 이름
	private String memName;
	
	// resume 작성여부
	private String resumeWriteYn;
	
	private String fileYn;
	private int fileNo;
	private MultipartFile file;
	
	private List<ResumeCareerVO> resumeCareerList;
	
	//1) resume에 insert되어있으니
	//2) resume의 기본키를 resumeSkillList[0].resumeNo랑 resume의 기본키를 resumeSkillList[1].resumeNo에 넣어줘야 함
	//resumeSkillList[0].skillstackName => Javascript
	//resumeSkillList[1].skillstackName => Node.js
	private List<ResumeSkillVO> resumeSkillList;
	private List<CertificationVO> certificationList;
}
