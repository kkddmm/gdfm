package kr.co.gdfm.movie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gdfm.movie.model.Movie;
import kr.co.gdfm.movie.service.MovieService;

@RequestMapping("/movie")
@Controller
public class MovieController {

		@Autowired 
		MovieService movieService;
		
		//무비차트 화면 
		@RequestMapping("/movie_information")
		public String selectMovieInfoList(Model model) throws Exception {
			
			
			List<Movie> movieList = new ArrayList<>();
				movieList = movieService.selectMovieList();
			 model.addAttribute("movieList",movieList); 
			
			
			
			return "movie/movie_information";
		}
		
		//영화 상세보기 화면 
		@RequestMapping("/movie_detail/{movie_id}")
		public String selectMovieDetail(@PathVariable(value="movie_id",required=true ) int movie_id,Model model) throws Exception {
			
			Movie movie = movieService.selectMovieDetail(movie_id);
			model.addAttribute("movie",movie);
			
			
			return "movie/movie_detail";
		}
		
		//영화 상영예정작 화면 
		@RequestMapping("/movie_preview")
		public String selectMoviePreviewList() {
			
			
			
			return "movie/movie_preview";
		}
		
		
	
}
