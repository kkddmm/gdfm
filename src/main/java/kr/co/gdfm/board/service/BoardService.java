package kr.co.gdfm.board.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.board.model.Board;
import kr.co.gdfm.board.model.Boardcmtnotice;
import kr.co.gdfm.board.model.Boardtype;
import kr.co.gdfm.board.model.Comment;
import kr.co.gdfm.cinema.model.Cinema;

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
	
	// 게시글 공지
	public List<Board> getNoticeList(Map<String, Object> paramMap) throws Exception;

	// 영화관 목록
	public List<Cinema> getCinemaList(Map<String, Object> paramMap) throws Exception;
	
	// 댓글 등록
	public int commentInsert(Comment comment) throws Exception;

	public int commentInsertnotice(Boardcmtnotice boardcmtnotice) throws Exception;

	// 댓글 삭제
	public int commentDelete(int bo_co_id) throws Exception;
	
	// 댓글 수정
	public int commentUpdate(Map<String, Object> paramMap) throws Exception;

	// 댓글 목록
	public List<Comment> getCommentList(int bo_id) throws Exception;
	
	// 게시판타입 목록
	public List<Boardtype> getBoardtypeList(Map<String, Object> paramMap) throws Exception;
	
	public List<Boardtype> getadminBoardtypeList(Map<String, Object> paramMap) throws Exception;
	
	public Boardtype getBoardtype(int bo_type_code) throws Exception;

	public int insertBoardtype(Boardtype boardtype) throws Exception;

	public int updateBoardtype(Boardtype boardtype) throws Exception;

	public int deleteBoardtype(int bo_type_code) throws Exception;

}
