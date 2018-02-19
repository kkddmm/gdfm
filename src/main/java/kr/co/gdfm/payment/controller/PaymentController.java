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
	public String goPaymentPage(
			@RequestParam(required=false) Map<String, Object> paramMap) {
		
		
		
		
		
		
		
		
		
return "payment/801";		
	}
	
	
	
	@RequestMapping("/complete")
	@ResponseBody
	public Map<String, Object> payComplete(
			@RequestParam(required=false) Map<String, Object> paramMap) {

		//paramMap에 진행을 위한 파라미터가 모두 갖추어져 있어야 한다.
		
		
		
		Map<String, Object> success = new HashMap<>();




//paramMap에 들어있는 imp_uid,reservation_id,pay_amount=100 를 이용, pay 테이블에 해당정보를 insert한다


int insertPay = paymentService.insertPayment(paramMap);

success.put("insertCnt", insertPay);
System.out.println(paramMap);

		return success;
	}
	
	
	/*
	@RequestMapping("/complete")
	@ResponseBody
	public Map<String, Object> payComplete{
		
		Map<String, Object> success = new HashMap<>();
		
		return success;
		
	}
	*/
	
	

	
	
	
	
	
	
	
	
	
	
}
