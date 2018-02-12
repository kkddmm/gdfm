package kr.co.gdfm.reservation.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.reservation.model.MovieShowInfo;
import kr.co.gdfm.reservation.model.Reservation;


public interface ReservationService {

	

	public List<Map<String, Object>> getDateList();

	public List<MovieShowInfo> getShowInfo(Map<String, Object> paramMap);

	public Map<String, Object> getReserveShowInfo(int show_id);

	public List<Map<String, String>> getReservedSit(int show_id);

	public void insertReservation(Reservation reservation);

//	public int isReservedSit(Map<String, Object> paramMap);

	public int insertSit(Map<String, Object> paramMap);

	public int deleteSit(Map<String, Object> paramMap);




	
	
	
	
	
	
	
	
}
