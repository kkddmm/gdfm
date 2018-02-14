package kr.co.gdfm.movie.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.movie.model.MovieReview;



public interface MovieReviewService {

	
	//총 영화  리뷰  건수 조회 
		public int movieReviewCount(Map<String, Object> paramMap) throws Exception;
			
		
		
		
			
		//영화 리뷰 등록
		public int insertMovieReview(MovieReview moviereview) throws Exception;
		
		//영화 리뷰 수정
		public int updateMovieReview(MovieReview moviereview); 
		
		

		//영화 리뷰 조회  
		public List<MovieReview> selectReviewList(int movie_id);

		
		//영화 리뷰 삭제 
		public int deleteMovieReview(MovieReview moviereview);
	
	
	
	
}
