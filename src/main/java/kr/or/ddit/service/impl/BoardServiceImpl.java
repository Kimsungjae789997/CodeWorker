package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IBoardMapper;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;



@Service
public class BoardServiceImpl implements IBoardService{

	@Inject
	private IBoardMapper mapper;

//	@Override
//	public List<BoardVO> noticeList(Map<String, String> params) {
//		return mapper.noticeList(params);
//	}

	@Override
	public BoardVO noticeDetail(int boardNo) {
		return mapper.noticeDetail(boardNo);
	}

	@Override
	public int countNoticeList(PaginationInfoVO<BoardVO> pagingVO) {
		return mapper.countNoticeList(pagingVO);
	}

	@Override
	public List<BoardVO> noticeList(PaginationInfoVO<BoardVO> pagingVO) {
		return mapper.noticeList(pagingVO);
	}
	
	

}
