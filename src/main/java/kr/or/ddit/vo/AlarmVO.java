package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AlarmVO {

	 private int alarmNo;
	 private String memId;
	 private String alarmContent;
	 private String alarmDate;
	 private String alarmYn;
	 private String getId;
	 private String alarmType;
	 private int applyNo;	// 지원번호
	 // 읽지않은 알람 갯수 (Y인거)
	 private int noReadAlarm;
	 
	 private String recNtcTitle; // 공고제목
	 
	 private String status;
	 
	 private int proNo;
}
