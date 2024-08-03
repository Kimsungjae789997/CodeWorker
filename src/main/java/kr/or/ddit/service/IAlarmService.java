package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;

public interface IAlarmService {
	
	public List<AlarmVO> alarmList(AlarmVO vo);

	public ServiceResult updateAlarmRead(int alarmNo);

	public AlarmVO getNoReadAlarm(String memId);

	public List<AlarmVO> alarmList2(AlarmVO vo2);

}
