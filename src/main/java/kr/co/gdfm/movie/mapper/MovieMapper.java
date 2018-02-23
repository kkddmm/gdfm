package kr.co.gdfm.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.movie.model.Movie;

@Mapper
public interface MovieMapper {

	
		//상영중인 영화 리스트 조회
		public List<Movie> selectShowMovie();
		
		//영화 상세보기 리스트
		public Movie selectMovieDetail(int movie_id);

		
		public List<Movie> selectMovieList();
		
		
		public List<Movie> selectMovieListWithPaging(Map<String, Object> params);
		  
		//상영예정작인 영화 리스트 조회 
		public List<Movie> selectMoviePreviewList();
		
		//영화 장르  리스트 
		public List<String> selectGenreList(int movie_id);
		
		//영화 포스터 개수 
		public int getMovieCount(Map<String, Object> params);
		
		//영화 스틸컷 조회
		public List<String> selectStillCutList(int movie_id);
		
		
		
		
}
