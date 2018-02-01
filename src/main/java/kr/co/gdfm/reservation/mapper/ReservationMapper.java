package kr.co.gdfm.reservation.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.reservation.model.MovieShowInfo;

@Mapper
public interface ReservationMapper {

	List<Map<String, Object>> getDateList();

	List<MovieShowInfo> getShowInfo(Map<String, Object> paramMap);

	
	
	
	
	
}
