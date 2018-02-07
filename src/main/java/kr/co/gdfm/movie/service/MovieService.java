package kr.co.gdfm.movie.service;

import java.util.List;

import kr.co.gdfm.movie.model.Movie;


public interface MovieService {

	
	public List<Movie> selectShowMovie();

	public List<Movie> selectMovieList()throws Exception; 
	
	//영화포스터 상세정보보기 
	public Movie selectMovieDetail(int movie_id)throws Exception;
	
	//상영예정작 
	public List<Movie> selectMoviePreviewList() throws Exception;
	
	
	
}
