package kr.or.ddit.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IResumeMapper;
import kr.or.ddit.service.IResumeService;
import kr.or.ddit.vo.CertificationVO;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.ResumeCareerVO;
import kr.or.ddit.vo.ResumeFileVO;
import kr.or.ddit.vo.ResumeSkillVO;
import kr.or.ddit.vo.ResumeVO;
import kr.or.ddit.vo.SeekerVO;

@Service
public class ResumeServiceImpl implements IResumeService {

	@Inject
	private IResumeMapper resumeMapper;

	@Override
	public List<ResumeSkillVO> getTotalSkillName() {
		return resumeMapper.getTotalSkillName();
	}

	@Override
	public SeekerVO getSeekerInfo(String memId) {
		return resumeMapper.getSeekerInfo(memId);
	}

	@Override
	public EducationVO getEducation(String memId) {
		return resumeMapper.getEducation(memId);
	}

	@Override
	public int resumeAdd(ResumeVO vo) {
		return resumeMapper.resumeAdd(vo);
	}

	@Override
	public ResumeVO getResume(int resumeNo) {
		return resumeMapper.getResume(resumeNo);
	}

	@Override
	public List<ResumeVO> getResumes(String memId) {
		return resumeMapper.getResumes(memId);
	}

	@Override
	public ResumeVO resumeNameUpdate(ResumeVO resumeVO) {
		ResumeVO vo = null;
		int cnt = resumeMapper.resumeNameUpdate(resumeVO);
		if(cnt > 0) {
			vo = resumeMapper.resumeNameSelect(resumeVO);
		}
		
		return vo;
	}

	@Override
	public ServiceResult resumeDelete(ResumeVO resumeVO) {
		ServiceResult result = null;
		int cnt = 0;
		cnt = resumeMapper.resumeDelete(resumeVO);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return null;
	}

	@Override
	public ResumeVO getBasicResumeInfo(int resumeNo) {
		return resumeMapper.getBasicResumeInfo(resumeNo);
	}

	@Override
	public ServiceResult addResumeAllContent(ResumeVO resumeVO) {
		ServiceResult result = null;
		// 설정된 id와 일치하는 기본 이력서 설정을 모두 초기화
		resumeMapper.initBasicResume(resumeVO);
		int status1 = resumeMapper.updateResume(resumeVO);

		if(status1 > 0) {
			if(resumeVO.getResumeCareerList() != null) {
				for(int i = 0; i < resumeVO.getResumeCareerList().size(); i++) {
					ResumeCareerVO careerVO = resumeVO.getResumeCareerList().get(i);
					if(StringUtils.isBlank(careerVO.getResCareerType())) {
						resumeVO.getResumeCareerList().get(i).setResCareerType("퇴사");
					}else {
						resumeVO.getResumeCareerList().get(i).setResCareerType("재직 중");
					}
				}
				status1 += resumeMapper.insertResumeCareer(resumeVO.getResumeCareerList());
			}
			
			if(resumeVO.getResumeSkillList() != null) 
				status1 += resumeMapper.insertResumeSkill(resumeVO.getResumeSkillList());
			
			if(resumeVO.getCertificationList() != null) 
				status1 += resumeMapper.insertCertification(resumeVO.getCertificationList());
		}
		
		if (status1 > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	

	@Override
	public ResumeVO getResumeContent(int resumeNo) {
		return resumeMapper.getResumeContent(resumeNo);
	}

	@Override
	public List<ResumeSkillVO> getUserSkillList(int resumeNo) {
		return resumeMapper.getUserSkillList(resumeNo);
	}

	@Override
	public List<ResumeCareerVO> getUserCareerList(int resumeNo) {
		return resumeMapper.getUserCareerList(resumeNo);
	}

	@Override
	public List<CertificationVO> getUserCertificationList(int resumeNo) {
		return resumeMapper.getUserCertificationList(resumeNo);
	}

	@Override
	public ServiceResult uploadFile(HttpServletRequest req, ResumeFileVO resumeFileVO) {
		ServiceResult result = null;
		MultipartFile file = resumeFileVO.getFile();
		
		ResumeVO resumeVO = new ResumeVO();
		resumeVO.setResumeName(file.getOriginalFilename()); 
		resumeVO.setMemId(resumeFileVO.getMemId());
		int cnt = resumeMapper.insertResume(resumeVO);
		
		if(cnt > 0) {
			try {
				// 파일 정보 초기화
				ResumeFileVO fileVO = new ResumeFileVO(resumeFileVO.getFile());
				FileUpload(fileVO, resumeVO.getResumeNo(),req);
			} catch (Exception e) {
				e.printStackTrace();
			}

			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// 파일 업로드
	private void FileUpload(ResumeFileVO resumeFileVO, int resumeNo, HttpServletRequest req) throws IllegalStateException, IOException {
		String savePath = "/resources/resume/";
		 if(resumeFileVO != null) {
			 if(resumeFileVO.getFileSize() > 0) {
					String saveName = UUID.randomUUID().toString();	
					saveName = saveName + "_" + resumeFileVO.getFileName().replaceAll(" ", "_");
					String saveLocate = req.getServletContext().getRealPath(savePath + resumeNo);
					File file = new File(saveLocate);
					if(!file.exists()) {
						file.mkdirs();
					}
					// 파일 복사를 하기 위한 최종 경로
					saveLocate += "/" + saveName;
					
					resumeFileVO.setResumeNo(resumeNo);
					resumeFileVO.setFileSavepath(saveLocate);
					resumeMapper.insertResumeFile(resumeFileVO);
					
					// 파일 복사를 하기 위한 target
					File saveFile = new File(saveLocate);
					resumeFileVO.getFile().transferTo(saveFile);
			 }
		 }
	}

	@Override
	public ResumeFileVO resumeDownload(int fileNo) {
		ResumeFileVO resumeFileVO = resumeMapper.resumeDownload(fileNo);
		if(resumeFileVO == null) {
			throw new RuntimeException();
		}
		return resumeFileVO;
	}

	@Override
	public ServiceResult updateResumeAllContent(HttpServletRequest req, ResumeVO resumeVO) {
		
		ServiceResult result = null;
		
		String uploadPath = req.getServletContext().getRealPath("/resources/resumeProfile");
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String profileImg = ""; //
		try {
			MultipartFile profileImgFile = resumeVO.getResumeProfile();
			if(profileImgFile != null && profileImgFile.getOriginalFilename() != null 
					&& !profileImgFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + profileImgFile.getOriginalFilename();
				uploadPath += "/" + fileName;
				profileImgFile.transferTo(new File(uploadPath)); 
				profileImg = "/resources/resumeProfile/" + fileName;
			}
			resumeVO.setResumeProfileUrl(profileImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 설정된 id와 일치하는 기본이력서 여부 모두 초기화
		resumeMapper.initBasicResume(resumeVO);
		int status1 = resumeMapper.updateResume(resumeVO);
		int resumeNo = resumeVO.getResumeNo();
		
		if(status1 > 0) {
			// 받아온 데이터에서 경력 부분이 null이 아닐 때 추가
			if(resumeVO.getResumeCareerList() != null) {
				for(int i = 0; i < resumeVO.getResumeCareerList().size(); i++) {
					ResumeCareerVO careerVO = resumeVO.getResumeCareerList().get(i);
					if(StringUtils.isBlank(careerVO.getResCareerType())) {
						resumeVO.getResumeCareerList().get(i).setResCareerType("퇴사");
					}else {
						resumeVO.getResumeCareerList().get(i).setResCareerType("재직중");
					}
				}
				resumeMapper.deleteUserResumeCareerList(resumeNo); // 기존데이터 삭제 후 추가
				List<ResumeCareerVO> userResumeCareerList = resumeVO.getResumeCareerList();
				for(ResumeCareerVO resumeCareerVO : userResumeCareerList) {
					status1 += resumeMapper.instResumeCareer(resumeCareerVO);
				}
			}
			
			// 받아온 데이터에서 스킬 부분이 null이 아닐 때 추가
			if(resumeVO.getResumeSkillList() != null) {
				resumeMapper.deleteUserResumeSkillList(resumeNo); // 기존데이터 삭제 후 추가
				List<ResumeSkillVO> userResumeSkillList = resumeVO.getResumeSkillList();
				status1 += resumeMapper.insertResumeSkill(userResumeSkillList);
			}
			
			// 받아온 데이터에서 자격증 부분이 null이 아닐 때 추가
			if(resumeVO.getCertificationList() != null) {
				resumeMapper.deleteCertification(resumeNo); // 기존데이터 삭제 후 추가
				List<CertificationVO> certificationList = resumeVO.getCertificationList();
				for(int i = 0; i < certificationList.size(); i++) {
					CertificationVO certificationVO = certificationList.get(i);
					if(StringUtils.isBlank(certificationVO.getCertName())) {
						certificationList.remove(i);
					}
				}
				status1 += resumeMapper.insertCertification(certificationList);
			}
			
		}
		if(status1 > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
}