package kr.co.gdfm.snack.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.model.SnackBuy;

@Mapper
public interface SnackMapper {
	
	
	//스낵 개수
	public int selectSnackCount(Map<String, Object> params) ;
	
	//스낵 리스트
	public List<Snack> selectSnackList(Map<String, Object> params);
	
	//스낵 상세정보
	public Snack snackView(int snack_id);
	
	/*public int insertSnack(Snack snack);
	
	public int updateSnack(Snack snack) ;
	
	public int deleteSnack(Map<String, Object> params);*/
	
	//장바구니
	public void insertBasket(Snack snack) ;
	
	
	//스낵정보에서 구매하기 클릭했을 때
	public void basketClickBuy(SnackBuy snackBuy);
	
	
	//스낵 장바구니 목록
	public List<Snack> getBasketList(String mem_id);
	
	//스낵 장바구니 삭제
	public void deleteBasket(int snack_buy_id);
	
	//스낵 결제 상세 조회 (바로구매,1건)
	public Map<String, Object> getSnackBuyDetail(int snack_buy_id);
	
	
	//스낵 장바구니 결제화면 
	public Map<String, Object> snackToPayment(String mem_id, int snack_buy_id);
	
	//스낵구매 리스트
	public List<SnackBuy> selectSnackBuyList(Map<String, Object> paramMap);
	
	//스낵구매 개수
	public int selectSnackBuyCount(Map<String, Object> paramMap);

	//스낵구매 삭제
	public int deleteSnackBuy(int snack_buy_id);

	//스낵구매 삭제시 포인트 수정
	public int updateSnackBuyPoint(Map<String, Object> paramMap);
	
	//스낵 사용(사용일, 사용여부 업데이트)
	public int useSnack(int snack_buy_id);
	
	
}