package kr.co.gdfm.main.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.movie.model.Movie;

public interface MainService {
	
	public List<Movie> getMainMovieChartWithNoLogin() throws Exception;
	
	public List<Movie> getMainMovieChartWithLogin(Member member) throws Exception;
	
	public List<Movie> mainOpenMovieList() throws Exception;
	
	public List<Movie> mainPreMovieList() throws Exception;

}
