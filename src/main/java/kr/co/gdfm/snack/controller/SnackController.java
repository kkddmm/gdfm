package kr.co.gdfm.snack.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.service.SnackService;

@RequestMapping("/snack")
@Controller
public class SnackController {

	@Resource(name="snackService")
	SnackService snackService; 
	
	@RequestMapping("/snack")
	public String snackList(@RequestParam Map<String, Object> params, Model model ) throws Exception {
		
		System.out.println(params);
		System.out.println(params);
		System.out.println(params);
		System.out.println(params);
		System.out.println(params);
		

		
		List<Snack> snackList= snackService.getSnackList(params);
		model.addAttribute("snackList", snackList);
		
		
		for (Snack snack : snackList) {
			System.out.println(snack);
		}
		
		return "snack/snack";
	}
	
	
	
	
	@RequestMapping("/snack_detail")
	public String snackDetail() {
		
		
		return "snack/snack_detail";
	}
	
	
	@RequestMapping("/snack_basket")
	public String snackBasket() {
		
		
		
		
		return "snack/snack_basket";
	}
	
	@RequestMapping("/snack_pay")
	public String snackPay() {
		
		
		return "snack/snack_pay";
	}
	
}







