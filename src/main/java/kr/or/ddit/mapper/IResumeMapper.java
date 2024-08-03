package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CertificationVO;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.ResumeFileVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.ResumeVO;
import kr.or.ddit.vo.SeekerVO;

public interface IResumeMapper {

	public List<ResumeSkillVO> getTotalSkillName();
	public SeekerVO getSeekerInfo(String memId);
	public EducationVO getEducation(String memId);
	public int resumeAdd(ResumeVO vo);
	public ResumeVO getResume(int resumeNo);
	public List<ResumeVO> getResumes(String memId);
	public int resumeNameUpdate(ResumeVO resumeVO);
	public ResumeVO resumeNameSelect(ResumeVO resumeVO);
	public int resumeDelete(ResumeVO resumeVO);
	public ResumeVO getBasicResumeInfo(int resumeNo);
	
	public void initBasicResume(ResumeVO resumeVO);
	public int updateResume(ResumeVO resumeVO);
	public int insertResumeCareer(List<ResumeCareerVO> resumeCareerList);
	public int insertResumeSkill(List<ResumeSkillVO> resumeSkillList);
	public int insertCertification(List<CertificationVO> certificationList);
	public ResumeVO getResumeContent(int resumeNo);
	public List<ResumeSkillVO> getUserSkillList(int resumeNo);
	public List<ResumeCareerVO> getUserCareerList(int resumeNo);
	public List<CertificationVO> getUserCertificationList(int resumeNo);

	public int insertResume(ResumeVO resumeVO);
	public void insertResumeFile(ResumeFileVO resumeFileVO);
	public ResumeFileVO resumeDownload(int fileNo);

	public int deleteUserResumeCareerList(int resumeNo);
	public int deleteUserResumeSkillList(int resumeNo);
	public int deleteCertification(int resumeNo);
	// insertResumeCareer는 다중 insert 구문, 해당 mapper 기능은 단일을 for문을 통한 insert 기능
	public int instResumeCareer(ResumeCareerVO resumeCareerVO);

}
