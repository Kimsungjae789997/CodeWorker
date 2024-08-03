package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ResumeSkillVO {

	private String skillstackCode;
	private int resumeNo;
	private String skillstackName;
	
	private DetailCodeVO detailCodeVO;
}
