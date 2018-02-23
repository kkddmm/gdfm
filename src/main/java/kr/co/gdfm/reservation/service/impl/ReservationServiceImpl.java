package kr.co.gdfm.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
//	@Transactional
	public int insertSit(Map<String, Object> paramMap) {
			int i;
				reservationMapper.deleteUncountedSit();
				reservationMapper.deleteSitByReservationDel();
				i = reservationMapper.insertSit(paramMap);
			return i;
	}
	@Override
	public int deleteSit(Map<String, Object> paramMap) {
	return	reservationMapper.deleteSit(paramMap);
		
	}
	@Override
	public List<Reservation> getresrveList(Map<String, Object> paramMap) {
		
		return reservationMapper.selectresrveList(paramMap);
	}
	@Override
	public int getresrveCount(Map<String, Object> paramMap) {

		return reservationMapper.selectresrveCount(paramMap);
	}
	@Override
	public int deleteReserve(int reservation_id) {

		return reservationMapper.deleteReserve(reservation_id);
	}
	@Override
	public int updateReservePoint(Map<String, Object> paramMap) {
	
		return reservationMapper.updateReservePoint(paramMap);
	}

	
	
	
	
	
	
}
