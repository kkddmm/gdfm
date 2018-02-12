package kr.co.gdfm.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.reservation.mapper.ReservationMapper;
import kr.co.gdfm.reservation.model.MovieShowInfo;
import kr.co.gdfm.reservation.model.Reservation;
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

	@Override
	public void insertReservation(Reservation reservation) {
		
		reservationMapper.deleteOldReservation(reservation.getMem_id());
		
		reservationMapper.insertReservation(reservation);
		
		
	}
	/*@Override
	public int isReservedSit(Map<String, Object> paramMap) {
		return reservationMapper.isReservedSit(paramMap);
	}*/
	@Override
	public int insertSit(Map<String, Object> paramMap) {
		try {
			reservationMapper.deleteUncountedSit();
			return	reservationMapper.insertSit(paramMap);
			
			
			
			
		}catch(RuntimeException e){
			return 0;
		}
	}
	@Override
	public int deleteSit(Map<String, Object> paramMap) {
	return	reservationMapper.deleteSit(paramMap);
		
	}


	
	
	
	
	
}
