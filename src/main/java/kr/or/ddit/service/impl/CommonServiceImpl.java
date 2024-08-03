package kr.or.ddit.service.impl;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.ILoginMapper;
import kr.or.ddit.mapper.ISignupMapper;
import kr.or.ddit.service.ICommonService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SeekerVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CommonServiceImpl implements ICommonService {

	@Inject
	private PasswordEncoder pw;
	
	@Inject
	private ISignupMapper signupMapper;
	
	@Inject
	private ILoginMapper loginMapper;
	
	
	// 일반회원 회원가입
	@Override
	public ServiceResult signup(MemberVO memberVO) {
		ServiceResult result = null;
		memberVO.setMemPw(pw.encode(memberVO.getMemPw()));
		
		int status = signupMapper.signup1(memberVO);
					 signupMapper.signup2(memberVO);
		if(status > 0) {	// 회원가입 성공 - 1개의 권한 부여
			signupMapper.signupAuth(memberVO.getMemId());
			result = ServiceResult.OK;
		}else {	// 회원가입 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 일반회원 회원가입 - id 중복 체크
	@Override
	public ServiceResult seekerIdCheck(String memId) {
		ServiceResult result = null;
		MemberVO memberVO = loginMapper.seekerIdCheck(memId);
		if(memberVO != null) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	// 일반회원 회원가입 - 휴대폰 인증 api
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSCVO4X3FUSQQKL";
	    String api_secret = "HS0L7LFMJZZLEZPX7H6T31FJGWMU7YQQ";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "01031931413");    // 수신전화번호
	    params.put("from", "01031931413");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}

	@Override
	public void addInsert(SeekerVO seekerVO) {
		signupMapper.addInsert(seekerVO);
		
	}


}
