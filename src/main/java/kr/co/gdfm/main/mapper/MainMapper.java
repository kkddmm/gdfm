package kr.co.gdfm.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.movie.model.Movie;

@Mapper
public interface MainMapper {

	public List<Movie> getMainMovieChartWithNoLogin() throws Exception;

	public List<Movie> getMainMovieChartWithLogin(Member member) throws Exception;
	
	public List<Movie> mainOpenMovieList() throws Exception;
	
	public List<Movie> mainPreMovieList() throws Exception;

	public List<Cinema> selectCinemaList(Map<String, Object> paramMap) throws Exception;
	
	
	
	
}


