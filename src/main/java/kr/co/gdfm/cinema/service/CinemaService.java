package kr.co.gdfm.cinema.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.cinema.model.Cinema;

public interface CinemaService {
	
	
	
	/**
	 * 영화관 광역시/도 주소 가져오는 메소드
	 * @return
	 */
	public List<Cinema> selectCinemaAddr1();

	public List<Map<String, String>> getAddr2List(String ci_addr1);

	public List<Map<String, Object>> getMovieNameByCinema(Map<String, Object> paramMap);
	
	

}
