package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
public class CodingTestVO {

	 private int coteNo;
	 private String coteTitle;
	 private String questionContent;
	 private String coteLevelCode;
	 private String exAnswer1;
	 private String coteConstraints1;
	 private String coteRegDate;
	 private String coteUpdDate;
	 private String coteDelYn;
	 private String exAnswer2;
	 private String coteConstraints2;
	 private int exAnsnum1;
	 private int exAnsnum2;
	 private int exResnum1;
	 private int exResnum2;
	 
	 // 구직자가 문제푼 code를 저장해놓는 곳
	 private String code;
	 
	 // 코딩no를 가져와서 스토리지에 저장한다.
	 private List<Integer> arr;
	 
	 private String recNtcId;
	 
	 // 구직자 코테 결과창 담는 곳
	 private String output;
}
