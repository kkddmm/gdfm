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
	public List<Map<String, Object>> getAddr2List(Map<String, Object> paramMap) {
		return cinemaMapper.getCinemaAddr2(paramMap);
	}

	@Override
	public List<Map<String, Object>> getMovieNameByCinema(Map<String, Object> paramMap) {
		return cinemaMapper.getMovieNameByCinema(paramMap);
	}

	@Override
	public List<Cinema> selectCinemaListByMovie(int movie_id) {
		return cinemaMapper.selectCinemaListByMovie(movie_id);
	}

}
