package kr.or.ddit.mapper;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SeekerVO;

public interface ISignupMapper {

	// 일반회원 - 회원가입, 권한부여
	public int signup1(MemberVO memberVO);
	public void signup2(MemberVO memberVO);
	public  void signupAuth(String memId);
	// 모달창 경력/회원여부 추가정보 addinsert, 인재제안
	public void addInsert(SeekerVO seekerVO);

}
