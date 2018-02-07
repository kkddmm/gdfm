package kr.co.gdfm.reservation.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.reservation.model.MovieShowInfo;


public interface ReservationService {

	

	public List<Map<String, Object>> getDateList();

	public List<MovieShowInfo> getShowInfo(Map<String, Object> paramMap);

	public Map<String, Object> getReserveShowInfo(int show_id);

	public List<Map<String, String>> getReservedSit(int show_id);

	
	
	
	
	
	
	
	
}
