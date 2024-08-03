package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ProposalVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.SeekerVO;

public interface IProposalService {

	public int selectProposalCount(PaginationInfoVO<ProposalVO> pagingVOB);
	public List<ProposalVO> selectProposalList(PaginationInfoVO<ProposalVO> pagingVOB);
	
	public int totalSeekerListCount(PaginationInfoVO<SeekerVO> pagingVO);
	public List<SeekerVO> totalSeekerListForProposal(PaginationInfoVO<SeekerVO> pagingVO);
	
	public List<ResumeSkillVO> selectSkillList(int resumeNo);
	public String careerTotalDuration(int resumeNo);
	
	public ServiceResult insertProposal(ProposalVO proposalVO);
	
	public List<Map<String, Object>> getSkills();
	public List<Map<String, Object>> getLocations();
	public List<Map<String, Object>> getHasCareer();
	public List<Map<String, Object>> getCareerYears();
	public List<Map<String, Object>> getEducation();
	 
}
