package kr.co.gdfm.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.board.model.Board;
import kr.co.gdfm.board.model.Boardcmtnotice;
import kr.co.gdfm.board.model.Boardtype;
import kr.co.gdfm.boardqna.model.Comment;
import kr.co.gdfm.cinema.model.Cinema;

@Mapper
public interface BoardMapper {

	public int selectBoardCount(Map<String, Object> paramMap) throws Exception;

	public List<Board> selectBoardList(Map<String, Object> paramMap) throws Exception;

	public Board selectBoard(int bo_id) throws Exception;

	public int insertBoard(Board board) throws Exception;

	public int updateBoard(Board board) throws Exception;

	public int deleteBoard(Map<String, Object> paramMap) throws Exception;

	public int updateHitCnt(int bo_id) throws Exception;
	
	public List<Board> selectNoticeList(Map<String, Object> paramMap) throws Exception;

	public List<Cinema> selectCinemaList(Map<String, Object> paramMap) throws Exception;
	
	public List<Comment> getCommentList(int bo_id) throws Exception;
	
	public int commentInsert(Comment comment)throws Exception;

	public int insertBoardcmtnotice(Boardcmtnotice boardCmtnotice)throws Exception;
	
	public int commentDelete(int bo_co_id)throws Exception;
	
	public int commentUpdate(Map<String, Object> paramMap);

	public List<Boardtype> selectBoardtypeList(Map<String, Object> paramMap);
}
