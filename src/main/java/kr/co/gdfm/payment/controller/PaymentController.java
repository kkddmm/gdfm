package kr.co.gdfm.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.service.MemberService;
import kr.co.gdfm.payment.service.PaymentService;
import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.service.SnackService;

@Controller
@RequestMapping("/payment")
public class PaymentController {

@Autowired
PaymentService paymentService;

	@Autowired
	SnackService snackService;
	
	@Autowired
	MemberService memberService;
	

	@RequestMapping("/801")
	public String goPaymentPage(@RequestParam(required = false) Map<String, Object> paramMap,  Model model,				
			HttpSession session) {
		
		Member member =(Member)session.getAttribute("LOGIN_USER");
		
		
		
		
		paramMap.put("mem_id",member.getMem_id());
		paramMap.put("class_code",member.getClass_code());		
		
		
		String mem_id = member.getMem_id();
		Member memberInfo=null;
		
		if (paramMap.containsKey("basket")){
		
		//장바구니 결제
	
			List<Snack> snackList= snackService.getBasketList(mem_id);
			
	
			try {
				memberInfo = memberService.getMember(mem_id);
			} catch (Exception e) {				
				e.printStackTrace();
			}
			
			
			
			model.addAttribute("memberInfo",memberInfo);
			model.addAttribute("snackList",snackList);
			model.addAttribute("pageType", "B");	
			model.addAttribute("first_amount",paramMap.get("first_amount"));				
		}
		
		
		//직접구매(장바구니X)
		if (paramMap.containsKey("snackPage")) {

			
			
			try {
				memberInfo = memberService.getMember(mem_id);
			} catch (Exception e) {			
				e.printStackTrace();
			}
			
			
			
			
			String sbid= (String) paramMap.get("snack_buy_id");
			int snack_buy_id = Integer.parseInt(sbid);
			
			
			Map<String, Object> resultMap = new HashMap<>();
			resultMap = snackService.getSnackBuyDetail(snack_buy_id);
		
		
		model.addAttribute("memberInfo",memberInfo);
		model.addAttribute("resultMap", resultMap);
		model.addAttribute("pageType", "S");			
		}
		
		//영화예매에서 넘어옴
		if (paramMap.containsKey("reservation_id")){
			//paramMap에 처음 들어있는데이터 - reservation_id , first_amount(포인트/할인 계산전 총금액)
			Map<String, Object> resultMap = new HashMap<>();
			
			resultMap = paymentService.getReservationDetail(paramMap);
			resultMap.put("first_amount", paramMap.get("first_amount"));
				
			
			try {
				memberInfo = memberService.getMember(mem_id);
			} catch (Exception e) {				
				e.printStackTrace();
			}
			
			
			model.addAttribute("reservation_id",paramMap.get("reservation_id"));
			model.addAttribute("memberInfo",memberInfo);
			model.addAttribute("resultMap",resultMap);
			model.addAttribute("pageType", "M");
		}
		
		

		return "payment/801";
	}

	@RequestMapping("/802")
	public String payFinish(Model model) {
			
		
		
		
		return "/payment/802";
	}
	
	
	
	
	@RequestMapping("/complete")
	@ResponseBody
	public Map<String, Object> payComplete(@RequestParam(required = false) Map<String, Object> paramMap	
			,String mem_id
			,HttpSession session) {

		Map<String, Object> success = new HashMap<>();
		Member member =(Member)session.getAttribute("LOGIN_USER");
		
		
		paramMap.put("mem_id",member.getMem_id());
		paramMap.put("class_code",member.getClass_code());	
		
		
		
	
		
		
		
		System.out.println("controller에서 넣어줄  mem_id"+paramMap.get("mem_id"));
		
		
		// paramMap에 진행을 위한 파라미터가 모두 갖추어져 있어야 한다.


		// paramMap에 들어있는 imp_uid,reservation_id,pay_amount=100 를 이용, pay 테이블에 해당정보를
		// insert한다
		
		
		int insertPay = paymentService.insertPayment(paramMap);
		
		
		
		
		//결제 완료한 스낵 정보 마이페이지로 보냄
		mem_id=member.getMem_id();
		
		
		
		
		
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