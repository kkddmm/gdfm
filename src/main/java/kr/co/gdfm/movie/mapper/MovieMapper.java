package kr.co.gdfm.movie.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.movie.model.Movie;

@Mapper
public interface MovieMapper {

	
	//상영중인 영화 리스트 조회
		public List<Movie> selectShowMovie();
		
		//영화 상세보기 리스트
		public Movie selectMovieDetail(int movie_id)throws Exception;

		public List<Movie> selectMovieList()throws Exception;
		  
		//상영예정작인 영화 리스트 조회 
		public List<Movie> selectMoviePreviewList()throws Exception;
}
