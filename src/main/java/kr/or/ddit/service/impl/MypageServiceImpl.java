package kr.or.ddit.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IMypageMapper;
import kr.or.ddit.service.IMypageService;
import kr.or.ddit.vo.AnswerCodingTestVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.CodingTestVO;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.EducationVO;
import kr.or.ddit.vo.InterestRecNtcVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitmentCodingTestVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.SeekerVO;

@Service
public class MypageServiceImpl implements IMypageService {

	@Inject
	private IMypageMapper mypageMapper;
	
	// 마이페이지에서 일반회원 정보들 가져오기
	@Override
	public SeekerVO seekerMypageSelect(String memId) {
		  return mypageMapper.seekerMypageSelect(memId);
	}

	// 프로필
	@Override
	public SeekerVO seekerProfileSelect(String memId) {
		return mypageMapper.seekerProfileSelect(memId);
	}

	@Override
	public EducationVO seekerEduSelect(String memId) {
		return mypageMapper.seekerEduSelect(memId);
	}

	@Override
	public ServiceResult profileUpdate(HttpServletRequest req, MemberVO memberVO) {
		SeekerVO seekerVO = memberVO.getSeekerVO();
		EducationVO educationVO = memberVO.getEducationVO();
		ServiceResult result = null;
		
		// memName의 값 update 해주기
		memberVO.setMemId(seekerVO.getMemId());
		memberVO.setMemName(seekerVO.getSeekerName());
		mypageMapper.profileMemNameUpdate(memberVO);
		
	    // memId의 유무에 따라서 insert, update하기
		educationVO.setMemId(seekerVO.getMemId());
		int cnt1 = mypageMapper.checkMemIdExists(seekerVO.getMemId());
		if(cnt1 > 0) {
			mypageMapper.educationUpdate(educationVO);
		}else {
			mypageMapper.educationInsert(educationVO);
		}
		
	    // seekerVO때의 프로필 내용들 만 update해주기
	    String uploadPath = req.getServletContext().getRealPath("/resources/profile");
	    File file = new File(uploadPath);
	    if (!file.exists()) {
	        file.mkdirs();
	    }
	    String profileImg = "";
	    try {
	        MultipartFile profileImgFile = seekerVO.getImgFile();
	        if (profileImgFile.getOriginalFilename() != null && !profileImgFile.getOriginalFilename().equals("")) {
	            String fileName = UUID.randomUUID().toString();
	            fileName += "_" + profileImgFile.getOriginalFilename();
	            String fullPath = uploadPath + "/" + fileName;
	            profileImgFile.transferTo(new File(fullPath));
	            profileImg = "/resources/profile/" + fileName;
	        }
	        seekerVO.setSeekerProfileUrl(profileImg);

	        int cnt = mypageMapper.profileUpdate(seekerVO);
	        if (cnt > 0) {
	            result = ServiceResult.OK;
	        } else {
	            result = ServiceResult.FAILED;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return result;
	}

	@Override
	public Map<String, Integer> allCountSelect(String memId) {
		return mypageMapper.allCountSelect(memId);
	}

//  마이페이지에서 지원현황 지원완료애들 정보가져오기 
	@Override
	public List<ApplyVO> applySuccess(String memId) {
		return mypageMapper.applySuccess(memId);
	}

	@Override
	public int getCount1(String memId) {
		return mypageMapper.getCount1(memId);
	}

	@Override
	public int getCount2(String memId) {
		return mypageMapper.getCount2(memId);
	}

	@Override
	public int getCount3(String memId) {
		return mypageMapper.getCount3(memId);
	}

	@Override
	public int getCount4(String memId) {
		return mypageMapper.getCount4(memId);
	}

	@Override
	public int getCount5(String memId) {
		return mypageMapper.getCount5(memId);
	}

	@Override
	public List<ApplyVO> documentSuccess(String memId) {
		return mypageMapper.documentSuccess(memId);
	}

	@Override
	public List<ApplyVO> coteSuccess(String memId) {
		return mypageMapper.coteSuccess(memId);
	}

	@Override
	public List<ApplyVO> finalApplySuccess(String memId) {
		return mypageMapper.finalApplySuccess(memId);
	}

	@Override
	public List<ApplyVO> failApplySuccess(String memId) {
		return mypageMapper.failApplySuccess(memId);
	}

	@Override
	public List<RecruitmentCodingTestVO> coteNoSelect(String recNtcId) {
		return mypageMapper.coteNoSelect(recNtcId);
	}

	@Override
	public CodingTestVO getCoteInfo(int coteNo) {
		return mypageMapper.getCoteInfo(coteNo);
	}

	@Override
	public RecruitmentNoticeVO selectRecNtc(String recNtcId) {
		return mypageMapper.selectRecNtc(recNtcId);
	}

	@Override
	public int getRecCoteNo(Map<String, Object> map) {
		return mypageMapper.getRecCoteNo(map);
	}

	@Override
	public int getApplyNo(Map<String, Object> map) {
		return mypageMapper.getApplyNo(map);
	}

	@Override
	public ServiceResult coteInsert(Map<String, Object> map) {
		ServiceResult result = null;
		int cnt = mypageMapper.coteInsert(map);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public AnswerCodingTestVO selectAnswerCodingTest(Map<String, Object> map) {
		return mypageMapper.selectAnswerCodingTest(map);
	}

	@Override
	public ServiceResult coteUpdate(Map<String, Object> map) {
		ServiceResult result = null;
		int cnt = mypageMapper.coteUpdate(map);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// 시험응시 -> 응시완료 바꾸기
	@Override
	public ServiceResult updateTestStatus(Map<String, Object> map) {
		ServiceResult result = null;
		int cnt = mypageMapper.updateTestStatus(map);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<RecruitmentNoticeVO> bookMarkAll(String memId) {
		return mypageMapper.bookMarkAll(memId);
	}

	@Override
	public List<CorporationVO> goInterestCrpAll(String memId) {
		return mypageMapper.goInterestCrpAll(memId);
	}

	@Override
	public int getRecCount(String memId) {
		return mypageMapper.getRecCount(memId);
	}

	@Override
	public List<CorporationVO> goProposalAll(String memId) {
		return mypageMapper.goProposalAll(memId);
	}

	@Override
	public ServiceResult proposalAccept(int proNo) {
		ServiceResult result = null;
		int cnt = 0;
		cnt = mypageMapper.proposalAccept(proNo);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult proposalDeny(int proNo) {
		ServiceResult result = null;
		int cnt = 0;
		cnt = mypageMapper.proposalDeny(proNo);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}


}
