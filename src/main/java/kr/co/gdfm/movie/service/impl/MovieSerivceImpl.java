package kr.co.gdfm.movie.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.movie.mapper.MovieMapper;
import kr.co.gdfm.movie.model.Movie;
import kr.co.gdfm.movie.service.MovieService;

@Service("movieService")
public class MovieSerivceImpl implements MovieService {

	@Autowired
	MovieMapper movieMapper;
	
	
	@Override
	public List<Movie> selectShowMovie() {
		
		return movieMapper.selectShowMovie();
	}
	
	
	
	
	
	//무비차트 포스터 가져오기 
	@Override
	public List<Movie> selectMovieList() {
		
		List<Movie> movieList = new ArrayList<>();
		movieList = movieMapper.selectMovieList();
		
		return movieList;
	}
	
	//상영예정작 포스터 가져오기 
	@Override
	public List<Movie> selectMoviePreviewList()  {
		
		List<Movie> movieList = new ArrayList<>();
		movieList = movieMapper.selectMoviePreviewList();
		
		return movieList;
	}

	@Override
	public Movie selectMovieDetail(int movie_id)  {
		
			//return type 이 남음 
		Movie movie =	movieMapper.selectMovieDetail(movie_id);
		
		//Movie movieList = movieMapper.selectMovieDetail(movie_id);
		
		movie.setMovie_genre_name(movieMapper.selectGenreList(movie_id));
		movie.setStillcut(movieMapper.selectStillCutList(movie_id));
		//movieList.setStillcut_id(movie_id);
		
		
		return movie;
	}

	//영화 포스터 개수 
	@Override
	public int getMovieCount(Map<String, Object> params) {
		
		return movieMapper.getMovieCount(params);
	}

	@Override
	public List<Movie> selectMovieListWithPaging(Map<String, Object> params) {
	
		
		return movieMapper.selectMovieListWithPaging(params);
	}

	

	
	

	

	
	
	
	
	
	
}
