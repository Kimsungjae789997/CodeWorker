package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruiterVO;

public interface IMyCorpMgmtMapper {

	public MemberVO addMemberIdCheck(String memId);
	public int addMember1(MemberVO memberVO);
	public int addMember2(MemberVO memberVO);
	public void addMemberAuth(String memId);
	public List<MemberVO> selectMemberList(PaginationInfoVO<MemberVO> pagingVO);
	public int selectMemberCount(PaginationInfoVO<MemberVO> pagingVO);
	public int deleteRecruiterMember(String memId);
	public int deleteMemberAuth(String memId);
	public void deleteCommonMember(String memId);
	
	// aside Profile 정보
	public List<RecruiterVO> getAsideProfile(String memId);
	
	public String getCrpIdByMemId(String currentUserId);

}
