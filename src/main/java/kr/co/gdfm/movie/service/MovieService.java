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


	
	

	

	

	
	
	
	
}
