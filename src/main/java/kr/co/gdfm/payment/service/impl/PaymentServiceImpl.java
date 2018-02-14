package kr.co.gdfm.payment.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.payment.mapper.PaymentMapper;
import kr.co.gdfm.payment.service.PaymentService;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentMapper paymentMapper;
	
	
	@Override
	public int insertPayment(Map<String, Object> paramMap) {
		int insertPay = 0;
		int snackUpdate = 0;
		int reservationUpdate = 0;
		if(paramMap.containsKey("reservation_id")) {
			//paramMap에 reservation_id 가 존재하므로 영화 예매 결제이다, 그러므로 해당 예약정보의 pay_id 를 업데이트해준다.
			insertPay = paymentMapper.insertPayment(paramMap);		
			reservationUpdate =  paymentMapper.reservationPayUpdate(paramMap);
		}
		if(paramMap.containsKey("snack_buy_id")) {
			//paramMap에 snack_buy_id 가 존재하므로 스낵 결제이다, 그러므로 해당 스낵 구매정보의 pay_id 를 업데이트해준다.
			insertPay = paymentMapper.insertPayment(paramMap);		
			reservationUpdate =  paymentMapper.snackPayUpdate(paramMap);
		}
return insertPay+snackUpdate+reservationUpdate;  //정상적인 처리가 완료되었을때 항상 2가 반환되어야 한다.

	}
	
	
	
	
	

}
