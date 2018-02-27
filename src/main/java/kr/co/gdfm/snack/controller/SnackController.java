package kr.co.gdfm.snack.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gdfm.board.service.BoardService;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.service.MemberService;
import kr.co.gdfm.snack.Page.SnackPaging;
import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.model.SnackBuy;
import kr.co.gdfm.snack.service.SnackService;

@RequestMapping("/snack")
@Controller
public class SnackController {

	@Resource(name = "snackService")
	SnackService snackService;

	@Resource(name = "memberService")
	MemberService memberService;

	@Resource(name = "boardService")
	BoardService boardService;

	@RequestMapping("/snack")
	public String snackList(@RequestParam Map<String, Object> params,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "6") int pageSize, Model model)
			throws Exception {

		int totalCount = 0;

		totalCount = snackService.getSnackCount(params);

		SnackPaging snackPaging = new SnackPaging(totalCount, pageSize, currentPage);
		
		/**/ Snack snack = new Snack();
		
		
		params.put("startRow", snackPaging.getStartRow());
		params.put("endRow", snackPaging.getEndRow());
		params.put("snack",snack.getSnack_buy_id());

		List<Snack> snackList = snackService.getSnackList(params);
		model.addAttribute("snackList", snackList);
		model.addAttribute("snackPaging", snackPaging);
		
		
		/**/model.addAttribute("snack",snack);
		
		// return new ResponseEntity<Model>(model, HttpStatus.OK);

		return "snack/snack";
	}

	@RequestMapping("/snackjson")
	@ResponseBody
	
	public List<Snack> snackjson(@RequestParam Map<String, Object> params,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "6") int pageSize)
			throws Exception {

		int totalCount = 0;

		totalCount = snackService.getSnackCount(params);

		SnackPaging snackPaging = new SnackPaging(totalCount, pageSize, currentPage);
		
		
		System.out.println(snackPaging.getStartRow());
		System.out.println(snackPaging.getEndRow());

		params.put("startRow", snackPaging.getStartRow());
		params.put("endRow", snackPaging.getEndRow());

		List<Snack> snackList = snackService.getSnackList(params);
//		model.addAttribute("snackList", snackList);
//		model.addAttribute("snackPaging", snackPaging);

//		return new ResponseEntity<Model>(model, HttpStatus.OK);
		return snackList;

		// return "snack/snack";
	}

	@RequestMapping("/snack_detail/{snack_id}")
	public String snackDetail(@PathVariable(value = "snack_id", required = true) int snack_id, 			
			 HttpSession session,
			@RequestParam Map<String, Object> params, Model model) throws Exception {

		Snack snack = null;
		Member member = null;

		if (snack_id != 0) {
			snack = snackService.snackView(snack_id);
			}
		
		model.addAttribute("snack", snack);

		System.out.println("스낵 아이디:" + snack_id);
	
		return "snack/snack_detail";
	}
	
	@RequestMapping("/snack_detail_ajax")
	@ResponseBody
	public Map<String, Object> basketClickBuy(SnackBuy snackBuy){			
		
		Member member=new Member();
		//바로 구매(insert)
			snackService.basketClickBuy(snackBuy);			
	
		
		Map<String, Object>  paramMap = new HashMap<>();
		
		paramMap.put("snack_buy_id", snackBuy.getSnack_buy_id());		
		paramMap.put("mem_id", member.getMem_id());		
				
		return paramMap;
	}
	
	
	
	

	
	

	
	@RequestMapping("/snack_insertBasket")
	@ResponseBody
	public void insertBasket(Snack snack,
			HttpSession session) throws Exception {

		HashMap<String, Object> result = new HashMap<>();
		
		
		try {
			snackService.insertBasket(snack);
			result.put("status", true);
			result.put("message", "정상적으로 처리가 완료 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", false);
			result.put("message", e.getMessage());
		}
	}

	@RequestMapping("/snack_basket/{mem_id}")
	public String basketList(@PathVariable String mem_id, Model model) throws Exception {
		
		List<Snack> basketList = snackService.getBasketList(mem_id);
		
		model.addAttribute("basketList", basketList);

		return "snack/snack_basket";
	}

	@RequestMapping("/snack_deleteBasket")
	@ResponseBody
	public void deleteBasket(@RequestParam(value="snack_buy_id") int snack_buy_id) throws Exception {

		snackService.deleteBasket(snack_buy_id);
	}


}







