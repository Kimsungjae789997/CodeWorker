package kr.or.ddit.service.impl;
 
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IProposalMapper;
import kr.or.ddit.mapper.IRecruitmentNoticeMapper;
import kr.or.ddit.service.IProposalService;
import kr.or.ddit.service.IRecruitmentNoticeService;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ProposalVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.SeekerVO;

@Service
public class ProposalServiceImpl implements IProposalService {
	
	@Inject
	private IProposalMapper proposalMapper;
	
	@Override
	public int selectProposalCount(PaginationInfoVO<ProposalVO> pagingVOB) {
		return proposalMapper.selectProposalCount(pagingVOB);
	}

	@Override
	public List<ProposalVO> selectProposalList(PaginationInfoVO<ProposalVO> pagingVOB) {
		return proposalMapper.selectProposalList(pagingVOB);
	}


	@Override
	public int totalSeekerListCount(PaginationInfoVO<SeekerVO> pagingVO) {
		return proposalMapper.totalSeekerListCount(pagingVO);
	}

	@Override
	public List<SeekerVO> totalSeekerListForProposal(PaginationInfoVO<SeekerVO> pagingVO) {
		return proposalMapper.totalSeekerListForProposal(pagingVO);
	}

	@Override
	public List<ResumeSkillVO> selectSkillList(int resumeNo) {
		return proposalMapper.selectSkillList(resumeNo);
	}

	@Override
	public String careerTotalDuration(int resumeNo) {
		return proposalMapper.careerTotalDuration(resumeNo);
	}

	@Override
	public ServiceResult insertProposal(ProposalVO proposalVO) {
		ServiceResult result = null;
		int cnt = proposalMapper.insertProposal(proposalVO);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getSkills() {
		return proposalMapper.getSkills();
	}

	@Override
	public List<Map<String, Object>> getLocations() {
		return proposalMapper.getLocations();
	}

	@Override
	public List<Map<String, Object>> getHasCareer() {
		return proposalMapper.getHasCareer();
	}

	@Override
	public List<Map<String, Object>> getCareerYears() {
		return proposalMapper.getCareerYears();
	}

	@Override
	public List<Map<String, Object>> getEducation() {
		return proposalMapper.getEducation();
	}





	

}
