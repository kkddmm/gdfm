package kr.co.gdfm.boardqna.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.boardqna.model.Boardqna;
import kr.co.gdfm.boardqna.model.Comment;

@Mapper
public interface BoardqnaMapper {

	public int selectBoardqnaCount(Map<String, Object> paramMap) throws Exception;

	public List<Boardqna> selectBoardqnaList(Map<String, Object> paramMap) throws Exception;

	public Boardqna selectBoardqna(int bo_id) throws Exception;

	public int insertBoardqna(Boardqna boardqna) throws Exception;

	public int updateBoardqna(Boardqna boardqna) throws Exception;

	public int deleteBoardqna(Map<String, Object> paramMap) throws Exception;

	public int updateHitCntqna(int bo_id) throws Exception;
	
	public List<Comment> getCommentList(int bo_id) throws Exception;
	
	public int commentInsert(Comment comment)throws Exception;
	
	public int commentDelete(int bo_co_id)throws Exception;
	
	public int commentUpdate(Map<String, Object> paramMap);
}
