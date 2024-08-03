package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;

public interface IAlarmMapper {

	public List<AlarmVO> alarmList(AlarmVO vo);

	public int updateAlarmRead(int alarmNo);

	public AlarmVO getNoReadAlarm(String memId);

	public List<AlarmVO> alarmList2(AlarmVO vo2);

}
