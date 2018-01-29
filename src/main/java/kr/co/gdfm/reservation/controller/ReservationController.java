package kr.co.gdfm.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.cinema.service.CinemaService;
import kr.co.gdfm.movie.model.Movie;
import kr.co.gdfm.movie.service.MovieService;
import kr.co.gdfm.reservation.service.ReservationService;


@RequestMapping("/reservation")
@Controller
public class ReservationController {
	
	@Autowired
	MovieService movieService;
	@Autowired
	CinemaService cinemaService;
	@Autowired
	ReservationService reservationService;
	

	
	
	@RequestMapping("/101")
	public String reservePage(Model model) {
		
	List<Movie> movieList = movieService.selectShowMovie();
	List<Cinema> addr1List = cinemaService.selectCinemaAddr1();	
	List<Map<String, Object>> dateList = reservationService.getDateList();
	
	
	model.addAttribute("dateList", dateList);
	model.addAttribute("movieList", movieList);
	model.addAttribute("addr1List", addr1List);
		
		return "reservation/101";
		
	}
	
	
	
	@RequestMapping("/get/addr2")
	@ResponseBody
	public List<Map<String, String>> getCinemaAddr2(String ci_addr1){
		System.out.println(ci_addr1);
		List<Map<String, String>> addr2List = cinemaService.getAddr2List(ci_addr1);
		return addr2List;
	}
	
	
@RequestMapping("/get/movieName")
@ResponseBody
public List<Map<String, Object>> getMovieName(String ci_addr1, String ci_addr2){

//	System.out.println(paramMap.get("addr1"));
//	System.out.println(paramMap.get("addr2"));
	Map<String, Object> paramMap = new HashMap<>();
	paramMap.put("ci_addr1", ci_addr1);	
	paramMap.put("ci_addr2", ci_addr2);	
	
	List<Map<String, Object>> movieNameList = cinemaService.getMovieNameByCinema(paramMap);
	
	
	return movieNameList ;
	
	
	
}


@RequestMapping("/get/cinemaList")
@ResponseBody
public List<Cinema> getCinemaList(int movie_id){
	
	List<Cinema> cinemaList = new ArrayList<>();
	
	
	cinemaList = cinemaService.selectCinemaListByMovie(movie_id);

//	System.out.println(cinemaList.get(0).getCi_addr1());
	
	
	return cinemaList;
}










	
	
	
	
	
	
	
	
	

}
