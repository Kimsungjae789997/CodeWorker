package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruiterVO;

public interface IMyCorpMgmtService {
	
	public ServiceResult addMember(MemberVO memberVO);
	public ServiceResult addMemberIdCheck(String memId);
	public int selectMemberCount(PaginationInfoVO<MemberVO> pagingVO);
	public List<MemberVO> selectMemberList(PaginationInfoVO<MemberVO> pagingVO);
	public ServiceResult deleteMember(String memId);
	
	// aside Profile 정보
	public List<RecruiterVO> getAsideProfile(String memId);
	
	public String getCrpIdByMemId(String currentUserId);
	

}
