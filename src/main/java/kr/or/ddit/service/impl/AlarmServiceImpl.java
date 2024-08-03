package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IAlarmMapper;
import kr.or.ddit.service.IAlarmService;
import kr.or.ddit.vo.AlarmVO;

@Service
public class AlarmServiceImpl implements IAlarmService {

	@Inject
	IAlarmMapper alarmMapper;

	@Override
	public List<AlarmVO> alarmList(AlarmVO vo) {
		return alarmMapper.alarmList(vo);
	}

	@Override
	public ServiceResult updateAlarmRead(int alarmNo) {
		ServiceResult result= null;
		int cnt = alarmMapper.updateAlarmRead(alarmNo);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public AlarmVO getNoReadAlarm(String memId) {
		return alarmMapper.getNoReadAlarm(memId);
	}

	@Override
	public List<AlarmVO> alarmList2(AlarmVO vo2) {
		return alarmMapper.alarmList2(vo2);
	}

}
