package kr.co.gdfm.cinema.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.cinema.model.Cinema;

@Mapper
public interface CinemaMapper {

	public List<Cinema> selectCinemaAddr1();

	public List<Map<String, String>> getCinemaAddr2(String ci_addr1);
	
	
	public List<Map<String, Object>> getMovieNameByCinema(Map<String, Object> paramMap);

	public List<Cinema> selectCinemaListByMovie(int movie_id);
	
	
	
	
	

}
