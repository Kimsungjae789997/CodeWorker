package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.CodingTestVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;

public interface IRecruitInsertService {

	// 검색된 코딩테스트 문제갯수를 가져온다.
	public int selectCoteCount(PaginationInfoVO<CodingTestVO> pagingVO);
	// 총 코딩테스트 문제갯수를 가져온다.
	public List<CodingTestVO> coteMainSelect(PaginationInfoVO<CodingTestVO> pagingVO);
	// 로컬스토리지 저장할 정보들 가져오기
	public List<CodingTestVO> selectByCoteNoList(List<Integer> coteNoList);
	// 공고 최종 등록하기
	public ServiceResult lastInsert(RecruitmentNoticeVO recruitmentNoticeVO);
	// 첫번째로 공고 등록하기
	public int intialInsert(RecruitmentNoticeVO recruitmentNoticeVO, HttpServletRequest req);
	// 기업id가져오기
	public String selectCrpId(String memId);

}
