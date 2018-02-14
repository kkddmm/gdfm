package kr.co.gdfm.payment.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	
	@RequestMapping("/801")
	public String goPaymentPage(
			@RequestParam(required=false) Map<String, Object> paramMap) {
		
		
		
return "payment/801";		
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
}
