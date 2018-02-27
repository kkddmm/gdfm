package kr.co.gdfm.mypage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gdfm.common.util.PagingUtil;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.reservation.model.Reservation;
import kr.co.gdfm.reservation.service.ReservationService;
import kr.co.gdfm.snack.model.SnackBuy;
import kr.co.gdfm.snack.service.SnackService;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	SnackService snackService;
	
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping("/snackBuy")
	public String snackBuy(
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,
			@RequestParam(value="mem_id", required=false, defaultValue="") String mem_id,
			Model model
			) throws Exception {
			
			int pageCount = 5;	//기본값
			int totalCount = 0;
			
			
			Map<String, Object> paramMap = new HashMap<>();
	
			if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank( searchWord )) {
				paramMap.put("searchType", searchType);
				paramMap.put("searchWord", searchWord);
			}
			
			if(StringUtils.isNotBlank(mem_id)) {
				paramMap.put("mem_id", mem_id);
			}
			// 총 게시글 수
			totalCount = snackService.getSnackBuyCount(paramMap);
			
			// 페이징 처리
			PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
			
			
			
			paramMap.put("startRow", pagingUtil.getStartRow());
			paramMap.put("endRow", pagingUtil.getEndRow());
			
			List<SnackBuy> snackBuy = snackService.getSnackBuyList(paramMap);
			
			
			
			String curTime=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			model.addAttribute("snackBuy", snackBuy);
			model.addAttribute("pagingUtil", pagingUtil);
			model.addAttribute("curTime",curTime);
			
		
		return "mypage/snackBuy";
	}
	
//	@RequestMapping("/useSnack")
//	@ResponseBody
//	public Map<String, Object> useSnack( 
//		@RequestParam(value="snack_buy_id") int snack_buy_id
//		){	
//		
//		int cnt = snackService.useSnack(snack_buy_id);
//				
//		Map<String, Object> paramMap=new HashMap<>();
//		
//		if(cnt==0) {
//			paramMap.put("result", "false");			
//		}else {
//			
//			paramMap.put("result", "true");
//		}		
//		return paramMap;
//	}
	
	@RequestMapping("/snackBuyDelete")
	public String snackBuyDelete(
			HttpSession session,
			@RequestParam("snack_buy_id") int snack_buy_id,
			@RequestParam("mem_point") int mem_point,
			@RequestParam("mem_id") String mem_id,
			Model model
			) {
						
		Member member = (Member)session.getAttribute("LOGIN_USER");
					
		//if(member == null) {
		//	return "redirect:/login/loginForm";
		//}
		
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "취소되었습니다.";
		String locationURL = "/admin/snackBuy";
		
		try {
			Map<String, Object> paramMap = new HashMap<>();
			
			paramMap.put("mem_point", mem_point);
			paramMap.put("mem_id", mem_id);
			
			int updCnt2 = snackService.updateSnackBuyPoint(paramMap);
			
			int updCnt = snackService.deleteSnackBuy(snack_buy_id);
			
			if(updCnt == 0) {
				isError = true;
				message = "취소 실패하였습니다.";
			}
		}catch (Exception e) {
			isError = true;
			message = "취소 실패하였습니다.";
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	@RequestMapping("/reserveList")
	public String reserveList(
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,
			@RequestParam(value="mem_id", required=false, defaultValue="") String mem_id,
			@ModelAttribute("now") Date now,
			Model model
			) throws Exception {
			
			int pageCount = 5;	//기본값
			int totalCount = 0;
			
			
			Map<String, Object> paramMap = new HashMap<>();
	
			if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank( searchWord )) {
				paramMap.put("searchType", searchType);
				paramMap.put("searchWord", searchWord);
			}
			
			if(StringUtils.isNotBlank(mem_id)) {
				paramMap.put("mem_id", mem_id);
			}
			// 총 게시글 수
			totalCount = reservationService.getresrveCount(paramMap);
			
			// 페이징 처리
			PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
			
			paramMap.put("startRow", pagingUtil.getStartRow());
			paramMap.put("endRow", pagingUtil.getEndRow());
			
			List<Reservation> resrveList = reservationService.getresrveList(paramMap);
			
			model.addAttribute("resrveList", resrveList);
			model.addAttribute("pagingUtil", pagingUtil);
		
		return "mypage/reserveList";
	}
	
		@RequestMapping("/reserveDelete")
		public String reserveDelete(
			HttpSession session,
			@RequestParam("reservation_id") int reservation_id,
			@RequestParam("mem_point") int mem_point,
			@RequestParam("mem_id") String mem_id,
			Model model
			) {
						
		Member member = (Member)session.getAttribute("LOGIN_USER");
					
		//if(member == null) {
		//	return "redirect:/login/loginForm";
		//}
		
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "취소되었습니다.";
		String locationURL = "/mypage/reserveList";
		
		try {
			Map<String, Object> paramMap = new HashMap<>();
			
			paramMap.put("mem_point", mem_point);
			paramMap.put("mem_id", mem_id);
			
			int updCnt2 = reservationService.updateReservePoint(paramMap);
			
			int updCnt = reservationService.deleteReserve(reservation_id);
			
			if(updCnt == 0) {
				isError = true;
				message = "취소 실패하였습니다.";
			}
		}catch (Exception e) {
			isError = true;
			message = "취소 실패하였습니다.";
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
}
