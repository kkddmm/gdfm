package kr.co.gdfm.snack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/Snack")
@Controller
public class SnackController {

	@RequestMapping("/snack")
	public String snackList() {
		
		
		
		
		return "Snack/snack";
		
	}
	
	
}
