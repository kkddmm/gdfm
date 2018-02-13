package kr.co.gdfm.snack.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.snack.mapper.SnackMapper;
import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.service.SnackService;

@Service("snackService")
public class SnackServiceImpl implements SnackService {

	@Autowired
	SnackMapper snackMapper;

	//스낵메뉴 개수
	@Override
	public int getSnackCount(Map<String, Object> params) throws Exception {
		
		return snackMapper.selectSnackCount(params);
	}	
	
	//스낵메뉴 리스트
	@Override
	public List<Snack> getSnackList(Map<String, Object> params) throws Exception {

		return snackMapper.selectSnackList(params);
	}
	//스낵메뉴 상세정보
	@Override
	public Snack snackView(int snack_id) throws Exception {

		return snackMapper.snackView(snack_id);
	}

	/*
	 * @Override public int insertSnack(Snack snack) throws Exception {
	 * 
	 * return snackMapper.insertSnack(snack); }
	 * 
	 * @Override public int deleteSnack(Map<String, Object> params) throws Exception
	 * {
	 * 
	 * return snackMapper.deleteSnack(params); }
	 * 
	 * @Override public int updateSnack(Snack snack) throws Exception {
	 * 
	 * return snackMapper.updateSnack(snack); }
	 */
	//장바구니 담기
	@Override
	public void insertBasket(Map<String, Object> params) throws Exception {
			snackMapper.insertBasket(params);
		}
	//장바구니 보기
	@Override
	public List<Snack> getBasketList(String mem_id) throws Exception {
		
		return snackMapper.getBasketList(mem_id);
	}
	//장바구니 삭제
	@Override
	public void deleteBasket(int snack_buy_id) throws Exception {
		
		snackMapper.deleteBasket(snack_buy_id);
	}

	

	
	
	

}











