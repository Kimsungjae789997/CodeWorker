package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IRecruitmentMgmtMapper;
import kr.or.ddit.service.IRecruitmentMgmtService;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSkillStackVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RecruitmentMgmtServiceImpl implements IRecruitmentMgmtService {
	
	@Inject
	private IRecruitmentMgmtMapper recruitmentMgmtMapper;
	
	@Override
	public String selectCrpId(String memId) {
		return recruitmentMgmtMapper.selectCrpId(memId);
	}

	@Override
	public int selectRecruitmentCount(PaginationInfoVO<RecruitmentNoticeVO> pagingVO) {
		return recruitmentMgmtMapper.selectRecruitmentCount(pagingVO);
	}

	@Override
	public List<RecruitmentNoticeVO> selectRecruitmentAllSelect(PaginationInfoVO<RecruitmentNoticeVO> pagingVO) {
		return recruitmentMgmtMapper.selectRecruitmentAllSelect(pagingVO);
	}

	@Override
	public int selectApplicantCount(String recNtcId) {
		return recruitmentMgmtMapper.selectApplicantCount(recNtcId);
	}

	@Override
	public RecruitmentNoticeVO recruitmentDetail(String recNtcId) {
		return recruitmentMgmtMapper.recruitmentDetail(recNtcId);
	}

	@Override
	public List<RecruitmentSkillStackVO> selectSkillStack(String recNtcId) {
		return recruitmentMgmtMapper.selectSkillStack(recNtcId);
	}

	@Override
	public CorporationVO selectCorporation(String crpId) {
		return recruitmentMgmtMapper.selectCorporation(crpId);
	}

	@Override
	public int recruitmentDelete(String recNtcId) {
		return recruitmentMgmtMapper.recruitmentDelete(recNtcId);
	}

}
