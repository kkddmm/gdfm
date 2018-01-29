package kr.co.gdfm.common.cinemalist.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.cinema.model.Cinema;

public interface CinemaListService {
	// 영화관 목록
	public List<Cinema> getCinemaList(Map<String, Object> paramMap) throws Exception;
}
