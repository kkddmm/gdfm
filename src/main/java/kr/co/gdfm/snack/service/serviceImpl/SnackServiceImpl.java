package kr.co.gdfm.snack.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.snack.mapper.SnackMapper;
import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.model.SnackBuy;
import kr.co.gdfm.snack.service.SnackService;

@Service("snackService")
public class SnackServiceImpl implements SnackService {
	

	@Autowired
	SnackMapper snackMapper;

	//스낵메뉴 개수
	@Override
	public int getSnackCount(Map<String, Object> params) {
		
		return snackMapper.selectSnackCount(params);
	}	
	
	//스낵메뉴 리스트
	@Override
	public List<Snack> getSnackList(Map<String, Object> params) {

		return snackMapper.selectSnackList(params);
	}
	//스낵메뉴 상세정보
	@Override
	public Snack snackView(int snack_id) {

		return snackMapper.snackView(snack_id);
	}

	
	 
	//장바구니 담기
	@Override
	public void insertBasket(Snack snack) {
			snackMapper.insertBasket(snack);
		}
	
	
	
	
	//스낵 메뉴에서 구매하기 버튼 클릭했을 때 
	@Override
	public void basketClickBuy(SnackBuy snackBuy) {
		
		snackMapper.basketClickBuy(snackBuy);
	}

	
	
	
	
	//장바구니 보기
	@Override
	public List<Snack> getBasketList(String mem_id) {
		
		return snackMapper.getBasketList(mem_id);
	}
	//장바구니 삭제
	@Override
	public void deleteBasket(int snack_buy_id) {
		
		snackMapper.deleteBasket(snack_buy_id);
	}

	//스낵 결제 상세 조회 (바로구매,1건)
	@Override
	public Map<String, Object> getSnackBuyDetail(int snack_buy_id) {

		return snackMapper.getSnackBuyDetail(snack_buy_id);
	}

	
	
	//스낵 장바구니 결제화면 
	public Map<String, Object> snackToPayment(String mem_id,int snack_buy_id) {

		return snackMapper.snackToPayment(mem_id,snack_buy_id);
	}
	
	//스낵 구매리스트
	@Override
	public List<SnackBuy> getSnackBuyList(Map<String, Object> paramMap) {

		return snackMapper.selectSnackBuyList(paramMap);
	}

	//스낵 구매개수
	@Override
	public int getSnackBuyCount(Map<String, Object> paramMap) {
		
		return snackMapper.selectSnackBuyCount(paramMap);
	}
	
	//스낵 구매한거 삭제
	@Override
	public int deleteSnackBuy(int snack_buy_id) {
		
		return snackMapper.deleteSnackBuy(snack_buy_id);
	}

	
	@Override
	public int updateSnackBuyPoint(Map<String, Object> paramMap) {

		return snackMapper.updateSnackBuyPoint(paramMap);
	}
	
	//스낵 사용확인(관리자가)
	@Override
	public int useSnack(int snack_buy_id) {
		
		return snackMapper.useSnack(snack_buy_id);
	}
	
	//스낵정보 입력(관리자)
	@Override
	public int insertSnack(Snack snack) {
		
		return snackMapper.insertSnack(snack);
	}

	//스낵정보 삭제(관리자)
	@Override
	public int deleteSnack(int snack_id) {
		
		return snackMapper.deleteSnack(snack_id);
	}

	
	
	
	
	
	
	
}










