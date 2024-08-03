package kr.or.ddit.mapper;

import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface ILoginMapper {

	// username을 통해 조회해온 권한명
	public String selectUserRole(String username);
	public MemberVO readByUserId(Map<String, String> userParam);
	public MemberVO seekerIdCheck(String memId);

}
