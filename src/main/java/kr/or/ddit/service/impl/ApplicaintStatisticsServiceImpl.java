package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IApplicantStatisticsMapper;
import kr.or.ddit.service.IApplicaintStatisticsService;
import kr.or.ddit.vo.ApplyVO;

@Service
public class ApplicaintStatisticsServiceImpl implements IApplicaintStatisticsService {

	@Inject
	private IApplicantStatisticsMapper statisticsMapper; 
	
	@Override
	public int getTotalViews() {
		return statisticsMapper.getTotalViews();
	}

	@Override
	public int getTotalApply() {
		return statisticsMapper.getTotalApply();
	}

	@Override
	public int getTotalExpPerson() {
		return statisticsMapper.getTotalExpPerson();
	}

	@Override
	public int getTotalNewComer() {
		return statisticsMapper.getTotalNewComer();
	}

	@Override
	public List<ApplyVO> getApplicantByDay() {
		return statisticsMapper.getApplicantByDay();
	}

	@Override
	public List<ApplyVO> getApplicantByEdu() {
		return statisticsMapper.getApplicantByEdu();
	}

	@Override
	public List<ApplyVO> getApplicantByMajor() {
		return statisticsMapper.getApplicantByMajor();
	}

}
