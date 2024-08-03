package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CertificationVO;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeFileVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.ResumeVO;
import kr.or.ddit.vo.SeekerVO;

public interface IResumeService {

	public List<ResumeSkillVO> getTotalSkillName();
	public SeekerVO getSeekerInfo(String memId);
	public EducationVO getEducation(String memId);
	public int resumeAdd(ResumeVO vo);
	public ResumeVO getResume(int resumeNo);
	public List<ResumeVO> getResumes(String memId);
	public ResumeVO resumeNameUpdate(ResumeVO resumeVO);
	public ServiceResult resumeDelete(ResumeVO resumeVO);
	public ResumeVO getBasicResumeInfo(int resumeNo);
	public ServiceResult addResumeAllContent(ResumeVO resumeVO);
	public ResumeVO getResumeContent(int resumeNo);
	public List<ResumeSkillVO> getUserSkillList(int resumeNo);
	public List<ResumeCareerVO> getUserCareerList(int resumeNo);
	public List<CertificationVO> getUserCertificationList(int resumeNo);
	public ServiceResult uploadFile(HttpServletRequest req, ResumeFileVO fileVO);
	public ResumeFileVO resumeDownload(int fileNo);
	
	public ServiceResult updateResumeAllContent(HttpServletRequest req, ResumeVO resumeVO);
}
