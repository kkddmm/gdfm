package kr.co.gdfm.reservation.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {

	List<Map<String, Object>> getDateList();

	
	
	
	
	
}
