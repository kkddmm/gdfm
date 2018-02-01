package kr.co.gdfm.snack.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.snack.model.Snack;

public interface SnackService {

	// 스낵메뉴보기
	public List<Snack> getSnackList(Map<String, Object> params) throws Exception;

	// 스낵 상세정보
	public Snack snackView(int snack_id) throws Exception;

	/*
	 * //스낵 정보입력 public int insertSnack(Snack snack) throws Exception;
	 * 
	 * //스낵 정보 삭제 public int deleteSnack(Map<String, Object> params) throws
	 * Exception;
	 * 
	 * //스낵 정보 수정 public int updateSnack(Snack snack) throws Exception;
	 */

	// 스낵 장바구니에 추가
	public void insertBasket(Map<String, Object> params) throws Exception;
	
	//스낵 장바구니 목록 보기
	public List<Snack> getBasketList(Map<String, Object> params) throws Exception;
	
	// 스낵 장바구니 삭제

	// 스낵 결제

	// 스낵 결제취소

}
