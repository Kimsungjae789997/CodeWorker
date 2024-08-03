package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CodingTestVO;
import kr.or.ddit.vo.InterviewVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;

public interface RecruitInsertMapper {

	public int selectCoteCount(PaginationInfoVO<CodingTestVO> pagingVO);

	public List<CodingTestVO> coteMainSelect(PaginationInfoVO<CodingTestVO> pagingVO);

	public List<CodingTestVO> selectByCoteNoList(Map<String, List<Integer>> coteMap);

	public int intialInsert(RecruitmentNoticeVO recruitmentNoticeVO);

	public String selectCrpId(String memId);

	public void skillInsert(Map<String, Object> paramMap);

	public void insertInterview(InterviewVO interviewVO);

	public void insertSelfIntro(Map<String, Object> paramMap);

	public void insertCodingTest(Map<String, Object> paramMap);

}
