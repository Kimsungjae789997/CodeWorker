package kr.or.ddit.vo;

import lombok.Data;

@Data
public class EducationVO {
	
	private int eduNo;
	private String memId;
	private String eduTypeCode; //공통코드임
	private String eduType;
	private String eduName;
	private String eduMajor;
	private String eduGraduatedYn;
	private String eduGraduatedDate;
	private String eduInsertDate;
	private String eduEnterDate;

}
