package kr.co.gdfm.common.cinemalist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.cinema.model.Cinema;

@Mapper
public interface CinemaListMapper {
	public List<Cinema> selectCinemaList(Map<String, Object> paramMap) throws Exception;
}
