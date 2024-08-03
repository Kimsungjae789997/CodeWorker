package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IBoardService {

	//List<BoardVO> noticeList(Map<String, String> params);

	BoardVO noticeDetail(int boardNo);

	int countNoticeList(PaginationInfoVO<BoardVO> pagingVO);

	List<BoardVO> noticeList(PaginationInfoVO<BoardVO> pagingVO);



}
