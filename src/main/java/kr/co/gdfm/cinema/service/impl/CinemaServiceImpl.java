package kr.co.gdfm.cinema.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.cinema.mapper.CinemaMapper;
import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.cinema.service.CinemaService;

@Service("cinemaService")
public class CinemaServiceImpl implements CinemaService {

	@Autowired
	CinemaMapper cinemaMapper;

	@Override
	public List<Cinema> selectCinemaAddr1() {
		return cinemaMapper.selectCinemaAddr1();
	}

	@Override
	public List<Map<String, String>> getAddr2List(String ci_addr1) {

		System.out.println(ci_addr1);

		return cinemaMapper.getCinemaAddr2(ci_addr1);
	}

	@Override
	public List<Map<String, Object>> getMovieNameByCinema(Map<String, Object> paramMap) {
		return cinemaMapper.getMovieNameByCinema(paramMap);
	}

}
