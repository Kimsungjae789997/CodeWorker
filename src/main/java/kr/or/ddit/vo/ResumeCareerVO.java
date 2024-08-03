package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ResumeCareerVO {

	private int resCareerNo;
	private int resumeNo;
	private String resCareerName;
	private String resCareerDept;
	private String resCareerPosition;
	private String resCareerContent;
	private String resCareerType;
	private String resCareerJoinDate;
	private String resCareerOutDate;
	private String resCareerInsertDate;
	
	//
	private String careerTotalDuration;
	private String careerYears;
	
}
