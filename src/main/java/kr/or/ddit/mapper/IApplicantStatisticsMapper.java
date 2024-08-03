package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ApplyVO;

public interface IApplicantStatisticsMapper {

	public int getTotalViews();
	public int getTotalApply();
	public int getTotalExpPerson();
	public int getTotalNewComer();
	public List<ApplyVO> getApplicantByDay();
	public List<ApplyVO> getApplicantByEdu();
	public List<ApplyVO> getApplicantByMajor();

}

