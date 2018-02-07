package kr.co.gdfm.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.reservation.mapper.ReservationMapper;
import kr.co.gdfm.reservation.model.MovieShowInfo;
import kr.co.gdfm.reservation.service.ReservationService;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{

@Autowired ReservationMapper reservationMapper;
	
	@Override
	public List<Map<String, Object>> getDateList() {
		return reservationMapper.getDateList();
	}

	@Override
	public List<MovieShowInfo> getShowInfo(Map<String, Object> paramMap) {
		return reservationMapper.getShowInfo(paramMap);
	}

	@Override
	public Map<String, Object> getReserveShowInfo(int show_id) {
		// TODO Auto-generated method stub
		return reservationMapper.getReserveShowInfo(show_id);
	}

	@Override
	public List<Map<String, String>> getReservedSit(int show_id) {
		return reservationMapper.getReservedSit(show_id);
	}


	
	
	
	
	
}
