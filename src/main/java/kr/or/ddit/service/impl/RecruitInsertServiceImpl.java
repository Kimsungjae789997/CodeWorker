package kr.or.ddit.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.RecruitInsertMapper;
import kr.or.ddit.service.IRecruitInsertService;
import kr.or.ddit.vo.CodingTestVO;
import kr.or.ddit.vo.InterviewVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import kr.or.ddit.vo.RecruitmentSelfIntroVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RecruitInsertServiceImpl implements IRecruitInsertService {

	@Inject
	private RecruitInsertMapper recruitInsertMapper;
	
	@Override
	public int selectCoteCount(PaginationInfoVO<CodingTestVO> pagingVO) {
		return recruitInsertMapper.selectCoteCount(pagingVO);
	}

	@Override
	public List<CodingTestVO> coteMainSelect(PaginationInfoVO<CodingTestVO> pagingVO) {
		return recruitInsertMapper.coteMainSelect(pagingVO);
	}

	@Override
	public List<CodingTestVO> selectByCoteNoList(List<Integer> coteNoList) {
		Map<String, List<Integer>> coteMap = new HashMap<String, List<Integer>>();
		coteMap.put("coteNoList", coteNoList);
		return recruitInsertMapper.selectByCoteNoList(coteMap);
	}

	@Override
	public ServiceResult lastInsert(RecruitmentNoticeVO recruitmentNoticeVO) {
	
		// 면접장소 insert
		InterviewVO interviewVO = new InterviewVO();
		interviewVO.setRecNtcId(recruitmentNoticeVO.getRecNtcId());
	    interviewVO.setIntvwDate(recruitmentNoticeVO.getDatetime());	    
		interviewVO.setIntvwLocation(recruitmentNoticeVO.getMemPostcode() + recruitmentNoticeVO.getMemAddress1() + recruitmentNoticeVO.getMemAddress2());
		recruitInsertMapper.insertInterview(interviewVO);
		
		// 공고별 자기소개문항 insert하기
		 if (recruitmentNoticeVO.getSelfIntroList() != null) {
		        for (RecruitmentSelfIntroVO selfIntro : recruitmentNoticeVO.getSelfIntroList()) {
		            Map<String, Object> paramMap = new HashMap<>();
		            paramMap.put("recNtcId", recruitmentNoticeVO.getRecNtcId());
		            paramMap.put("selfIntroTitle", selfIntro.getSelfIntroTitle());
		            paramMap.put("selfIntroContent", selfIntro.getSelfIntroContent());
		            recruitInsertMapper.insertSelfIntro(paramMap);
		        }
		    }
		 
		 // 공고마다 코딩테스트 어떤거 보는지 db에 insert
		 if (recruitmentNoticeVO.getCodingTestList() != null) {
		        for (CodingTestVO codingTest : recruitmentNoticeVO.getCodingTestList()) {
		            Map<String, Object> paramMap = new HashMap<>();
		            paramMap.put("recNtcId", recruitmentNoticeVO.getRecNtcId());
		            paramMap.put("coteNo", codingTest.getCoteNo());
		            recruitInsertMapper.insertCodingTest(paramMap);
		        }
		}
		 
		 return ServiceResult.OK;
	}

	@Override
	public int intialInsert(RecruitmentNoticeVO recruitmentNoticeVO, HttpServletRequest req) {
		String uploadPath = req.getServletContext().getRealPath("/resources/recruitNotice");
	    int cnt = 0;
		File file = new File(uploadPath);
	    if (!file.exists()) {
	        file.mkdirs();
	    }
	    String recruitNoticeImg = "";
	    try {
	        MultipartFile profileImgFile = recruitmentNoticeVO.getImgFile();
	        if (profileImgFile.getOriginalFilename() != null && !profileImgFile.getOriginalFilename().equals("")) {
	            String fileName = UUID.randomUUID().toString();
	            fileName += "_" + profileImgFile.getOriginalFilename();
	            String fullPath = uploadPath + "/" + fileName;
	            profileImgFile.transferTo(new File(fullPath));
	            recruitNoticeImg = "/resources/recruitNotice/" + fileName;
	        }
	        recruitmentNoticeVO.setRecNtcContent(recruitNoticeImg);

	        cnt = recruitInsertMapper.intialInsert(recruitmentNoticeVO);
	        if(cnt > 0) {
	        	log.info("recruitmentNoticeVO.getSkillstackList() ===" + recruitmentNoticeVO.getSkillstackList());
	            Map<String, Object> paramMap = new HashMap<>();
	            paramMap.put("recNtcId", recruitmentNoticeVO.getRecNtcId());
	            paramMap.put("skillstackList", recruitmentNoticeVO.getSkillstackList());
	            recruitInsertMapper.skillInsert(paramMap);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    
		return cnt;	
	}

	@Override
	public String selectCrpId(String memId) {
		return recruitInsertMapper.selectCrpId(memId);
	}




}
