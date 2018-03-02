package kr.co.gdfm.payment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.snack.model.Snack;

@Mapper
public interface PaymentMapper {

	int insertPayment(Map<String, Object> paramMap);

	int reservationPayUpdate(Map<String, Object> paramMap);

	//스낵 메뉴(직접구매) 구매 업데이트
	int snackPayUpdate(Map<String, Object> paramMap);
	
	//스낵 장바구니 업데이트
	int snackBasketPayUpdate(Map<String, Object> paramMap);

	//포인트 증가
	int addPoint(Map<String, Object> paramMap);

	//포인트 차감
	int minusPoint(Map<String, Object> paramMap);
	
	//결제 완료된 스낵 정보(마이페이지)
	public Map<String, Object> finishedPaySnack(String mem_id);
			
	//결제 완료된 영화 정보(마이페이지)
	public Map<String, Object> finishedPayCinema(String mem_id);

	//예매 상세정보
	Map<String, Object> getReservationDetail(Map<String, Object> paramMap);

	//예매한 좌석 정보
	List<String> reservationSitList(Map<String, Object> paramMap);
	
	

}