package kr.co.gdfm.boardqna.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.boardqna.model.Boardqna;
import kr.co.gdfm.boardqna.model.Comment;

public interface BoardqnaService {
	// 총 게시글 수
	public int getBoardqnaCount(Map<String, Object> paramMap) throws Exception;
	
	// 게시글 목록 조회
	public List<Boardqna> getBoardqnaList(Map<String, Object> paramMap) throws Exception;
	
	// 게시글 조회
	public Boardqna getBoardqna(int bo_id) throws Exception;
	
	// 게시글 등록
	public int insertBoardqna(Boardqna boardqna) throws Exception;
	
	// 게시글 수정
	public int updateBoardqna(Boardqna boardqna) throws Exception;
	
	// 게시글 삭제
	public int deleteBoardqna(Map<String, Object> paramMap) throws Exception;
	
	public int commentInsert(Comment comment) throws Exception;
	
	public int commentDelete(int bo_co_id) throws Exception;//
	
	public int commentUpdate(Map<String, Object> paramMap) throws Exception;

	public List<Comment> getCommentList(int bo_id) throws Exception;

}
