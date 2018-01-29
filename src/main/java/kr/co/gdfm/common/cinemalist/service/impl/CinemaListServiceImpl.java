package kr.co.gdfm.common.cinemalist.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.common.cinemalist.mapper.CinemaListMapper;
import kr.co.gdfm.common.cinemalist.service.CinemaListService;

@Service("cinamaListService")
public class CinemaListServiceImpl implements CinemaListService {
	@Autowired
	CinemaListMapper cinamaListMapper;
	
	@Override
	public List<Cinema> getCinemaList(Map<String, Object> paramMap) throws Exception {
		return cinamaListMapper.selectCinemaList(paramMap);
	}
	
}
