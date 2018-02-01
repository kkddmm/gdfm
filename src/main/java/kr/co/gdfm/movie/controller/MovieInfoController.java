package kr.co.gdfm.movie.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gdfm.movie.model.Movie;
import kr.co.gdfm.movie.service.MovieService;


@RequestMapping("/movie")
@Controller
public class MovieInfoController {

	@Autowired
	MovieService movieService;
	
	@RequestMapping("/movie_information")
	public String selectMovieInfoList(Model model) {
		
		
		List<Movie> movieList = new ArrayList<>();
			movieList = movieService.selectMovieList();
		 model.addAttribute("movieList",movieList); 
		
		
		
		return "movie/movie_information";
	}

	
}
