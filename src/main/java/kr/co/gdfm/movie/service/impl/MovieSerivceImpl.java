package kr.co.gdfm.movie.service.impl;

import java.util.ArrayList;
import java.util.List;

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
		// TODO Auto-generated method stub
		return movieMapper.selectShowMovie();
	}
	
	//
	
	
	
	//무비차트 포스터 가져오기 
	@Override
	public List<Movie> selectMovieList() throws Exception {
		
		List<Movie> movieList = new ArrayList<>();
		movieList = movieMapper.selectMovieList();
		
		return movieList;
	}
	
	//상영예정작 포스터 가져오기 
	@Override
	public List<Movie> selectMoviePreviewList() throws Exception {
		
		List<Movie> movieList = new ArrayList<>();
		movieList = movieMapper.selectMoviePreviewList();
		
		return movieList;
	}

	@Override
	public Movie selectMovieDetail(int movie_id) throws Exception {
		
			//return type 이 남음 
		Movie movie =	movieMapper.selectMovieDetail(movie_id);
		movie.setMovie_genre_name(movieMapper.selectGenreList(movie_id));
		
		
		
		
		
		List<String> selectGenreList = new ArrayList<>();
		selectGenreList = movieMapper.selectGenreList(movie_id);
		
		return movie;
	}

	
	
	
	
	
	
}
