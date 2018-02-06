package kr.co.gdfm.snack.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.snack.model.Snack;

@Mapper
public interface SnackMapper {
	
	

	public int selectSnackCount(Map<String, Object> params) throws Exception;
	
	public List<Snack> selectSnackList(Map<String, Object> params) throws Exception;
	
	public Snack snackView(int snack_id) throws Exception;
	
	public int insertSnack(Snack snack) throws Exception;
	
	public int updateSnack(Snack snack) throws Exception;
	
	public int deleteSnack(Map<String, Object> params) throws Exception;
	
	public void insertBasket(Map<String, Object> params) throws Exception;
	
	public List<Snack> getBasketList(String mem_id) throws Exception;
	
	public void deleteBasket(int snack_buy_id) throws Exception;
	
}