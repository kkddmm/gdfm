package kr.co.gdfm.payment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.snack.model.Snack;

@Mapper
public interface PaymentMapper {

	int insertPayment(Map<String, Object> paramMap);

	int reservationPayUpdate(Map<String, Object> paramMap);

	int snackPayUpdate(Map<String, Object> paramMap);

	int addPoint(Map<String, Object> paramMap);

	int minusPoint(Map<String, Object> paramMap);
	
	//결제 완료된 스낵 정보(마이페이지)
	public Map<String, Object> finishedPaySnack(String mem_id);
			
	//결제 완료된 영화 정보(마이페이지)
	public Map<String, Object> finishedPayCinema(String mem_id);

	Map<String, Object> getReservationDetail(Map<String, Object> paramMap);

	List<String> reservationSitList(Map<String, Object> paramMap);
	
	
	
	

}