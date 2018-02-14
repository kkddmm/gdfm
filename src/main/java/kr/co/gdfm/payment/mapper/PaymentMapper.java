package kr.co.gdfm.payment.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

	int insertPayment(Map<String, Object> paramMap);

	int reservationPayUpdate(Map<String, Object> paramMap);

	int snackPayUpdate(Map<String, Object> paramMap);
	
	
	
	
	
	

}
