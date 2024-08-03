package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IMyCorpMgmtMapper;
import kr.or.ddit.service.IMyCorpMgmtService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruiterVO;

@Service
public class MyCorpMgmtServiceImpl implements IMyCorpMgmtService {

	@Inject
	private PasswordEncoder pw;
	
	@Inject
	private IMyCorpMgmtMapper myCorpMgmtMapper;
	
	@Override
	public ServiceResult addMember(MemberVO memberVO) {
		ServiceResult result = null;
		memberVO.setMemPw(pw.encode(memberVO.getMemPw()));
		
		int status1 = myCorpMgmtMapper.addMember1(memberVO);
		int status2 = myCorpMgmtMapper.addMember2(memberVO);
		
		if(status1 > 0 && status2 > 0) {	// 회원가입 성공 - 1개의 권한 부여
			myCorpMgmtMapper.addMemberAuth(memberVO.getMemId());
			result = ServiceResult.OK;
		}else {	// 회원가입 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult addMemberIdCheck(String memId) {
		ServiceResult result = null;
		MemberVO memberVO = myCorpMgmtMapper.addMemberIdCheck(memId);
		if(memberVO != null) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	@Override
	public int selectMemberCount(PaginationInfoVO<MemberVO> pagingVO) {
		return myCorpMgmtMapper.selectMemberCount(pagingVO);
	}
	
	@Override
	public List<MemberVO> selectMemberList(PaginationInfoVO<MemberVO> pagingVO) {
		return myCorpMgmtMapper.selectMemberList(pagingVO);
	}
	
	@Override
	public ServiceResult deleteMember(String memId) {
		ServiceResult result = null;
		
		int status1 = myCorpMgmtMapper.deleteRecruiterMember(memId);
		int status2 = myCorpMgmtMapper.deleteMemberAuth(memId);
		if(status1 > 0 && status2 > 0) {
			myCorpMgmtMapper.deleteCommonMember(memId);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// aside Profile 정보
	@Override
	public List<RecruiterVO> getAsideProfile(String memId) {
		return myCorpMgmtMapper.getAsideProfile(memId);
	}

	@Override
	public String getCrpIdByMemId(String currentUserId) {
		return myCorpMgmtMapper.getCrpIdByMemId(currentUserId);
	}

	

}
