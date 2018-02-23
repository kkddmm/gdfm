package kr.co.gdfm.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.movie.model.MovieReview;

@Mapper
public interface MovieReviewMapper {

	//댓글 갯수
		public int movieReviewCount(Map<String, Object> paramMap) ;
		
	
	//댓글 목록
		public List<MovieReviewMapper> movieReviewList(Map<String, Object> paramMap) ;
	
	
	//댓글 작성
		public int movieReviewInsert(MovieReview movieReview) ;
	
	
	//댓글 수정
		public int movieReviewUpdate(MovieReview review) ;
	
	
	//댓글 삭제
		public int movieReviewDelete(MovieReview review) ;


		public List<MovieReview> selectReviewList(int movie_id);


		public int duplicationChk(Map<String, Object> params);


		public int insertUpDown(Map<String, Object> params);
	
	
	
}
