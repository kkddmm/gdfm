
package kr.co.gdfm.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.cinema.service.CinemaService;
import kr.co.gdfm.movie.model.Movie;
import kr.co.gdfm.movie.service.MovieService;
import kr.co.gdfm.reservation.model.MovieShowInfo;
import kr.co.gdfm.reservation.model.Reservation;
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
	public List<Map<String, Object>> getCinemaAddr2(@RequestParam Map<String, Object> paramMap) {
		List<Map<String, Object>> addr2List = cinemaService.getAddr2List(paramMap);
		return addr2List;
	}

	@RequestMapping("/get/movieName")
	@ResponseBody
	public List<Map<String, Object>> getMovieName(String ci_addr1, String ci_addr2) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ci_addr1", ci_addr1);
		paramMap.put("ci_addr2", ci_addr2);
		List<Map<String, Object>> movieNameList = cinemaService.getMovieNameByCinema(paramMap);
		return movieNameList;
	}

	@RequestMapping("/get/cinemaList")
	@ResponseBody
	public List<Cinema> getCinemaList(int movie_id) {
		List<Cinema> cinemaList = new ArrayList<>();
		cinemaList = cinemaService.selectCinemaListByMovie(movie_id);
		return cinemaList;
	}

	@RequestMapping("/get/showInfo")
	@ResponseBody
	public List<MovieShowInfo> getShowInfo(@RequestParam Map<String, Object> paramMap) {

		List<MovieShowInfo> resultList = new ArrayList<>();

		resultList = reservationService.getShowInfo(paramMap);

		return resultList;
	}

	@RequestMapping("/put/movieReservation")
	@ResponseBody
	public int insertReservation(Reservation reservation) {
		reservationService.insertReservation(reservation);
		//입력된 예약정보의 시간을 체크해서, 102 페이지에서 시간이 지난 후 어떤 액션을 취하던 뒤로 돌려보내야 함.		
		
		return reservation.getReservation_id();
		
		
		
		
	}

	@RequestMapping("/102")
	public String goReservationSit(@RequestParam int show_id, @RequestParam int reservation_id, Model model) {

		Map<String, Object> reserveMap = new HashMap<>();
		List<Map<String, String>> reservedSit = new ArrayList<>();

		reservedSit = reservationService.getReservedSit(show_id);
		reserveMap = reservationService.getReserveShowInfo(show_id);
		
		
		
		model.addAttribute("reserveMap", reserveMap);
		model.addAttribute("reservedSit", reservedSit);
		model.addAttribute("reservation_id", reservation_id);
//		model.addAttribute("reservation_reg_date",)
		return "reservation/102";
		
		
		
		
		
		
	}

/*	@RequestMapping("/isreserved")
	@ResponseBody
	public boolean isReservedSit(@RequestParam Map<String, Object> paramMap) {
		boolean reserved = false; // 트루일때는 안되게

		int check = reservationService.isReservedSit(paramMap);
		if (check != 0) {
			reserved = true;
		}
		return reserved;
	}*/

	@RequestMapping("/insertSit")
	@ResponseBody
	public Map<String, Object> insertSit(@RequestParam Map<String, Object> paramMap) {
		
		int success = 0;
		try {
			
			success = reservationService.insertSit(paramMap);
			
		}catch(RuntimeException e ) {
			e.printStackTrace();
		}
		
		
		
		
		Map<String, Object> successMap = new HashMap<>();
		successMap.put("success", success);
		return successMap;
	}

	@RequestMapping("/deleteSit")
	@ResponseBody
	public Map<String, Object> deleteSit(@RequestParam Map<String, Object> paramMap) {
		reservationService.deleteSit(paramMap);
		Map<String, Object> successMap = new HashMap<>();
		int success = reservationService.deleteSit(paramMap);
		successMap.put("success", success);
		return successMap;
	}

}
