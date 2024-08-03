package kr.or.ddit.controller.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IAlarmService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/alarm")
public class AlarmController {

	@Inject 
	IAlarmService alarmService;
	
	@RequestMapping(value = "/alarmList", method = RequestMethod.GET)
	public ResponseEntity<Map<String, List<AlarmVO>>> alarmList(){
		List<AlarmVO> alarmList = null;
		List<AlarmVO> alarmList2 = null;
		Map<String, List<AlarmVO>> map = new HashMap<String, List<AlarmVO>>();
		CustomUser user = 
				(CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberVO = user.getMember();
		if(memberVO!=null) {
			AlarmVO vo = new AlarmVO();
			vo.setMemId(memberVO.getMemId());
			
			
			alarmList = alarmService.alarmList(vo);			
	//		alarmList2 = alarmService.alarmList2(vo);		
			map.put("alarmList", alarmList);
		//	map.put("alarmList2", alarmList2);
		}
		return new ResponseEntity<Map<String,List<AlarmVO>>>(map,HttpStatus.OK);
		
	}
	

	@RequestMapping(value = "/updateAlarmRead", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> updateAlarmRead(@RequestBody AlarmVO alarmVO){
		int alarmNo = alarmVO.getAlarmNo();
		log.info("alarmNo ============================" + alarmNo);
		ServiceResult result = alarmService.updateAlarmRead(alarmNo);
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getNoReadAlarm", method = RequestMethod.POST)
	public ResponseEntity<AlarmVO> getNoReadAlarm(@RequestBody AlarmVO alarmVO){
		AlarmVO VO = alarmService.getNoReadAlarm(alarmVO.getMemId());
		return new ResponseEntity<AlarmVO>(VO,HttpStatus.OK);
	}
}
