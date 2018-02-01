package kr.co.gdfm.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/movie")
@Controller
public class MovieDetailController {

		@RequestMapping("/movie_detail")
		public String selectMovieDetailList() {
			
			
			
			return "movie/movie_detail";
		}
		
		@RequestMapping("/movie_preview")
		public String selectMoviePreviewList() {
			
			
			
			return "movie/movie_preview";
		}
	
}
