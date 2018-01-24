package kr.co.gdfm.movie.service.impl;

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
	
	
}
