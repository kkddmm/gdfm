package kr.co.gdfm.payment.service;

import java.util.Map;

public interface PaymentService {

	int insertPayment(Map<String, Object> paramMap);

	Map<String, Object> getReservationDetail(Map<String, Object> paramMap);
	
	
	

}