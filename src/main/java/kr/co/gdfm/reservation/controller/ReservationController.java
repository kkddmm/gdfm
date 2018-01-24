package kr.co.gdfm.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/reservation")
@Controller
public class ReservationController {
	
	
	@RequestMapping("/101")
	public String reservePage() {
		
		
		
		
		
		
		
		
		return "reservation/101";
		
	}
	
	
	
	
	
	

}
