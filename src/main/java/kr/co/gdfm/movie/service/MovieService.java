package kr.co.gdfm.movie.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.movie.model.Movie;


public interface MovieService {

	//영화 포스터 개수 
	public int getMovieCount(Map<String, Object> params);
	
	
	public List<Movie> selectMovieListWithPaging(Map<String, Object> params);
	

	public List<Movie> selectShowMovie();

	public List<Movie> selectMovieList(); 
	
	//영화포스터 상세정보보기 
	public Movie selectMovieDetail(int movie_id);
	
	//상영예정작 
	public List<Movie> selectMoviePreviewList();
	
	//영화 무비 포스터 등록 
	public int  insertMovie(Movie movie);

	//영화 무비 포스터 수정
	public int updateMovie(Movie movie);

	//영화 장르 전체 가져오기 
	public List<Map<String,Object>> getMovieGenreList();
	
	//영화 차원 전체 가져오기
	public List<Map<String,Object>> getMovieDimensionList();
	
	//영화 무비 포스터 수정  
		public int updateMovie(int movie_id);
	
	
	
	//영화 무비 포스터 삭제 
	public int deleteMovie(int movie_id);
	

	
	

	

	

	
	
	
	
}
