package kr.co.gdfm.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gdfm.payment.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@RequestMapping("/801")
	public String goPaymentPage(@RequestParam(required = false) Map<String, Object> paramMap) {

		if (paramMap.containsKey("snackPage")) {

			//스낵관련 파라미터 들어왔을 때 작업. 주나누나가 하세요
			//포인트/등급할인 적용 되기전에 보낼 가격 파라미터 이름  =first_amount 근데 직접계산해도됨 
			
			
		}
		//영화예매에서 넘어옴
		if (paramMap.containsKey("reservation_id")) {
			//좌석예매페이지에서 넘어온 파라미터 reservation_id, first_amount, 
			//필요한 것, - 파라미터로 넘어온 예매번호로 예약된 좌석들 
			//그 예매 번호로 알수 있는 정보들, 상영관, 영화관, 영화번호, 
			
			
			

		}

		return "payment/801";
	}

	@RequestMapping("/complete")
	@ResponseBody
	public Map<String, Object> payComplete(@RequestParam(required = false) Map<String, Object> paramMap) {

		// paramMap에 진행을 위한 파라미터가 모두 갖추어져 있어야 한다.

		Map<String, Object> success = new HashMap<>();

		// paramMap에 들어있는 imp_uid,reservation_id,pay_amount=100 를 이용, pay 테이블에 해당정보를
		// insert한다

		int insertPay = paymentService.insertPayment(paramMap);

		success.put("insertCnt", insertPay);
		System.out.println(paramMap);

		return success;
	}

	/*
	 * @RequestMapping("/complete")
	 * 
	 * @ResponseBody public Map<String, Object> payComplete{
	 * 
	 * Map<String, Object> success = new HashMap<>();
	 * 
	 * return success;
	 * 
	 * }
	 */

}
