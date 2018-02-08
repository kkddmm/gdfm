package kr.co.gdfm.reservation.mapper;

import java.util.List;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.reservation.model.MovieShowInfo;
import kr.co.gdfm.reservation.model.Reservation;

@Mapper
public interface ReservationMapper {

	List<Map<String, Object>> getDateList();

	List<MovieShowInfo> getShowInfo(Map<String, Object> paramMap);

	Map<String, Object> getReserveShowInfo(int show_id);

	List<Map<String, String>> getReservedSit(int show_id);

	void insertReservation(Reservation reservation);

    int isReservedSit(Map<String, Object> paramMap);

	void insertSit(Map<String, Object> paramMap);

	void deleteSit(Map<String, Object> paramMap);

	
	
	
	
	
}
