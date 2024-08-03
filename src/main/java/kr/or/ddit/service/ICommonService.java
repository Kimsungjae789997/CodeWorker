package kr.or.ddit.service;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SeekerVO;

public interface ICommonService {

	// 일반회원_회원가입
	public ServiceResult signup(MemberVO memberVO);
	// 일반회원 회원가입 - 아이디 중복 체크
	public ServiceResult seekerIdCheck(String memId);
	// 일반회원 회원가입 - 휴대폰 api인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
	// 모달창 insert
	public void addInsert(SeekerVO seekerVO);

}
