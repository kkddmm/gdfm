package kr.co.gdfm.snack.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.model.SnackBuy;

public interface SnackService {

	//스낵메뉴 개수
	public int getSnackCount(Map<String, Object> params) ;	
	
	// 스낵메뉴보기
	public List<Snack> getSnackList(Map<String, Object> params) ;

	// 스낵 상세정보
	public Snack snackView(int snack_id) ;

	/*
	 * //스낵 정보입력 public int insertSnack(Snack snack) throws Exception;
	 * 
	 * //스낵 정보 삭제 public int deleteSnack(Map<String, Object> params) throws
	 * Exception;
	 * 
	 * //스낵 정보 수정 public int updateSnack(Snack snack) throws Exception;
	 */

	// 스낵 장바구니에 추가
	public void insertBasket(Snack snack) ;
	
	
	//스낵정보에서 구매하기 클릭했을 때
	public void basketClickBuy(SnackBuy snackBuy);	
	
	
	//스낵 장바구니 목록 보기
	public List<Snack> getBasketList(String mem_id) ;
		
	
	// 스낵 장바구니 삭제
	public void deleteBasket(int snack_buy_id);

	
	//스낵 결제 상세 조회 (바로구매,1건)제
	public Map<String, Object> getSnackBuyDetail(int snack_buy_id);
	
	
	//스낵 장바구니 결제화면 
	public Map<String, Object> snackToPayment(String mem_id, int snack_buy_id);
	
	//스낵구매 리스트
	public List<SnackBuy> getSnackBuyList(Map<String, Object> paramMap);

	//스낵구매 개수
	public int getSnackBuyCount(Map<String, Object> paramMap);

	//스낵구매 삭제
	public int deleteSnackBuy(int snack_buy_id);

	//스낵구매 삭제시 포인트 수정
	public int updateSnackBuyPoint(Map<String, Object> paramMap);
	
	
	
	//스낵 사용(사용일, 사용여부 업데이트)
	public int useSnack(int snack_buy_id);
	
	
	
	
}


