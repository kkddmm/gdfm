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

	@Override
	public List<Snack> getSnackList(Map<String, Object> params) throws Exception {

		return snackMapper.selectSnackList(params);
	}

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

	@Override
	public void insertBasket(Map<String, Object> params) throws Exception {
			snackMapper.insertBasket(params);
		}

}













