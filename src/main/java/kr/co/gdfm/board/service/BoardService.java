package kr.co.gdfm.board.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.board.model.Board;

public interface BoardService {
	// 총 게시글 수
	public int getBoardCount(Map<String, Object> paramMap) throws Exception;
	
	// 게시글 목록 조회
	public List<Board> getBoardList(Map<String, Object> paramMap) throws Exception;
	
	// 게시글 조회
	public Board getBoard(int bo_id) throws Exception;
	
	// 게시글 등록
	public int insertBoard(Board board) throws Exception;
	
	// 게시글 수정
	public int updateBoard(Board board) throws Exception;
	
	// 게시글 삭제
	public int deleteBoard(Map<String, Object> paramMap) throws Exception;
}
