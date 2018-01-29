package kr.co.gdfm.snack.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
		
		/*System.out.println(params);
		System.out.println(params);
		System.out.println(params);
		System.out.println(params);
		System.out.println(params);*/
		

		
		List<Snack> snackList= snackService.getSnackList(params);
		model.addAttribute("snackList", snackList);
		
	
		/*for (Snack snack : snackList) {
			System.out.println("스낵리스트:"+snack.getSnack_name());
		}*/
		
		return "snack/snack";
	}
	
	
	
	
	@RequestMapping("/snack_detail/{snack_id}")
	public String snackDetail(@PathVariable(value="snack_id", required=true )int snack_id, Model model, 
									@RequestParam(value="snack_type", required=false) String snack_type ) throws Exception {
		
		Snack snack = null;		
		
		if(snack_id !=0) {
			snack=snackService.snackView(snack_id);
		
		}
		
		model.addAttribute("snack", snack);
		model.addAttribute("snack_type", snack_type);
		
		System.out.println("스낵 아이디:"+snack_id);
		
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







