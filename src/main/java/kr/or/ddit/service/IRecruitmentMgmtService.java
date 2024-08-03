package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSkillStackVO;

public interface IRecruitmentMgmtService {

	public String selectCrpId(String memId);

	public int selectRecruitmentCount(PaginationInfoVO<RecruitmentNoticeVO> pagingVO);

	public List<RecruitmentNoticeVO> selectRecruitmentAllSelect(PaginationInfoVO<RecruitmentNoticeVO> pagingVO);

	public int selectApplicantCount(String recNtcId);

	public RecruitmentNoticeVO recruitmentDetail(String recNtcId);

	public List<RecruitmentSkillStackVO> selectSkillStack(String recNtcId);

	public CorporationVO selectCorporation(String crpId);

	public int recruitmentDelete(String recNtcId);

}
