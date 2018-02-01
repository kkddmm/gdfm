package kr.co.gdfm.snack.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gdfm.board.model.Board;
import kr.co.gdfm.snack.mapper.SnackMapper;
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
	public String snackDetail(@PathVariable(value="snack_id", required=true)int snack_id, Model model 
									 ) throws Exception {
		
		Snack snack = null;		
		
		if(snack_id !=0) {
			snack=snackService.snackView(snack_id);		
		}	
		/*
		 *mem_id required=false 보내줘야 함.
		 * */
		
		
		
		model.addAttribute("snack", snack);
		
		
		System.out.println("스낵 아이디:"+snack_id);
		
		return "snack/snack_detail";
	}
	
	
	@RequestMapping("/snack_insertBasket")
	@ResponseBody
	public  void insertBasket(@RequestParam Map<String, Object> params
			) throws Exception {
		System.out.println("snack_id="+params.get("snack_id"));
		System.out.println("snack_id="+params.get("snack_cnt"));
		
		HashMap<String, Object> result = new HashMap<>();
		
		try {			
			snackService.insertBasket(params);
			
			result.put("status", true);
			result.put("message", "정상적으로 처리가 완료 되었습니다.");
			
		} catch (Exception e) {			
			e.printStackTrace();
			result.put("status", false);
			result.put("message", e.getMessage());
		}
		
	

	}
	
	
	
	@RequestMapping("/snack_pay")
	public String snackPay() {
		
		
		return "snack/snack_pay";
	}
	
}







