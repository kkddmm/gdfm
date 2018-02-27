package kr.co.gdfm.payment.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.payment.mapper.PaymentMapper;
import kr.co.gdfm.payment.service.PaymentService;
import kr.co.gdfm.snack.model.Snack;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentMapper paymentMapper;
	
	
	@Override
	public int insertPayment(Map<String, Object> paramMap) {
		
		System.out.println("serviceImpl에서 받은 mem_id"+paramMap.get("mem_id"));
		int insertPay = 0;
		int snackUpdate = 0;
		int reservationUpdate=0;
		int pay_addpoint=0;
		
//		int i=1/0;
		int snack_buy_id= Integer.parseInt((String)paramMap.get("snack_buy_id"));
		int reservation_id=Integer.parseInt((String)paramMap.get("reservation_id"));
		
//		System.out.println(i);
		
		
		int payamount = Integer.parseInt((String)paramMap.get("pay_amount"));
		
		switch ((int)paramMap.get("class_code")){
		
		
		case 1:
			
			pay_addpoint=(int)(payamount*0.01);
			break;
		
		case 2:	
			
			pay_addpoint= (int) (payamount*0.1);						
			break;
			
		case 3:
			
			pay_addpoint= (int) (payamount*0.2);			
			break;
		}
		
		paramMap.put("pay_addpoint", pay_addpoint);
		
		
		System.out.println("reservation_id =" +reservation_id);
		System.out.println("snack_buy_id ="+snack_buy_id);

		
		//결제 테이블에 결제이력 추가
		insertPay = paymentMapper.insertPayment(paramMap);		
		//결제에 사용한 포인트 차감
		paymentMapper.minusPoint(paramMap);
		//등급별로 결제금액으로 계산한 포인트 적립
		paymentMapper.addPoint(paramMap);
		if(reservation_id!=0) {
			//paramMap에 reservation_id 가 존재하므로 영화 예매 결제이다, 그러므로 해당 예약정보의 pay_id 를 업데이트해준다.
			
			
			
			reservationUpdate =  paymentMapper.reservationPayUpdate(paramMap);
			
			
			
		}
		
		
		
		
		if(snack_buy_id!=0) {
			//paramMap에 snack_buy_id 가 존재하므로 스낵 결제이다, 그러므로 해당 스낵 구매정보의 pay_id 를 업데이트해준다.
			
			//스낵 구매이력에 null이었던 pay_id를 진행중인 결제 id로 업데이트
			snackUpdate =  paymentMapper.snackPayUpdate(paramMap);			
						
		}
		
		/*if(snack_buy_id==0&&reservation_id==0) {
			
//			장바구니			
		}*/
		
		
		
		return insertPay+snackUpdate+reservationUpdate;  //정상적인 처리가 완료되었을때 항상 2가 반환되어야 한다.

	}


	@Override
	public Map<String, Object> getReservationDetail(Map<String, Object> paramMap) {
		
		
	Map<String, Object> resultMap = paymentMapper.getReservationDetail(paramMap);
	// 지금 결제하려는 사람이 예약한 자리 
	List<String> sitList = paymentMapper.reservationSitList(paramMap);
	resultMap.put("sitList", sitList);
		
		return resultMap;
				
				
	}


	

	

}



