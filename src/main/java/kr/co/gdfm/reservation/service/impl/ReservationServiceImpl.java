package kr.co.gdfm.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.reservation.mapper.ReservationMapper;
import kr.co.gdfm.reservation.service.ReservationService;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{

@Autowired ReservationMapper reservationMapper;
	
	@Override
	public List<Map<String, Object>> getDateList() {
		return reservationMapper.getDateList();
	}


	
	
	
	
	
}
