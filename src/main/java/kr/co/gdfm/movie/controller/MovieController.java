package kr.co.gdfm.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gdfm.movie.Page.MoviePaging;
import kr.co.gdfm.movie.model.Movie;
import kr.co.gdfm.movie.model.MovieReview;
import kr.co.gdfm.movie.service.MovieReviewService;
import kr.co.gdfm.movie.service.MovieService;

@RequestMapping("/movie")
@Controller
public class MovieController {

	@Autowired
	MovieService movieService;

	@Autowired
	MovieReviewService movieReviewService;
	
	
	
	// 무비차트 화면
	@RequestMapping("/movie_information")
	public String selectMovieInfoList(Model model) throws Exception {

//		List<Movie> movieList = new ArrayList<>();
//		movieList = movieService.selectMovieList();
//		model.addAttribute("movieList", movieList);

		return "movie/movie_information";
	}

	// 영화 상세보기 화면
	@RequestMapping("/movie_detail/{movie_id}")
	public String selectMovieDetail(@PathVariable(value = "movie_id", required = true) int movie_id, Model model)
			throws Exception {

		List<MovieReview> movieReviewList = new ArrayList<>();
		List<String> movieGenreList = new ArrayList<>();
		
		movieReviewList = movieReviewService.selectReviewList(movie_id);
		
		
		Movie movie = movieService.selectMovieDetail(movie_id);
		
		model.addAttribute("movie", movie);
		model.addAttribute("movieReviewList", movieReviewList);
		model.addAttribute("movieGenreList",movieGenreList);
		
		
		
		return "movie/movie_detail";
	}
	
	

	// 영화 상영예정작 화면
	@RequestMapping("/movie_preview")
	public String selectMoviePreviewList() {

		return "movie/movie_preview";
	}

	// 영화 리뷰
	/*
	 * @RequestMapping("/movie_detail") public String selectMovieReview(Model model)
	 * throws Exception {
	 * 
	 * MovieReview movieReview = movieReviewService.selectMovieReview();
	 * 
	 * return "movie/movie_detail";
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value="/movieReviewInsert", method=RequestMethod.POST) public
	 * int InsertMovieReview(@PathVariable(value="movie_id",required=true ) int
	 * movie_id,Model model) throws Exception{
	 * 
	 * 
	 * 
	 * return 0; }
	 */

	// 영화 리뷰 리스트
	
	//영화 리뷰 삭제
	@RequestMapping("/deleteReview")
	@ResponseBody
	private Map<String, Object>  movieReviewDelete(MovieReview movieReview) {
		
		System.out.println(movieReview.getMovie_review_id());
		
		Map<String, Object> del_success = new HashMap<>();
		
		int i = movieReviewService.deleteMovieReview(movieReview);
		
		del_success.put("del_success", i);
		
		System.out.println("movieReview.getmovie_review_id()를 날려요  : " + movieReview.getMovie_review_id());
		
		return del_success;
	}
	
	//영화 리뷰 수정
	@RequestMapping("/updateReview")
	@ResponseBody
	private Map<String, Object> movieReviewUpdate(MovieReview movieReview) {
		
		System.out.println("updateReview : " + movieReview.getMovie_review_content());
		System.out.println("updateReview : " +movieReview.getMovie_review_id());
		System.out.println("updateReview : " +movieReview.getMovie_review_rate());
		
		
		Map<String, Object>  upd_success = new HashMap<>();
		
		int i= movieReviewService.updateMovieReview(movieReview);
				
		upd_success.put("upd_success", i);
		
		
		
		return upd_success;
	}
		
	
	@RequestMapping("/duplicationChk")
	@ResponseBody
	private Map<String, Object> duplicationChk(@RequestParam Map<String, Object> params) throws Exception {

		

		Map<String, Object> success = new HashMap<>();

		int i = movieReviewService.duplicationChk(params);

		success.put("success", i);

	
		return success;
	}

	@RequestMapping("/insertUpDown")
	@ResponseBody
	private Map<String, Object> insertUpDown(@RequestParam Map<String, Object> params) {
		

		Map<String, Object> success = new HashMap<>();

		int i=0;
		 
		
		try {
			
			i = movieReviewService.insertUpDown(params);
		}catch(RuntimeException e) {
			
			i=0;
		}
		
		
		
		
		System.out.println("i에 들어간 값 "+i);
		success.put("success", i);

	
		return success;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 영화 리뷰 작성
	@RequestMapping("/insertReview")
	@ResponseBody
	private Map<String, Object> movieReviewInsert(MovieReview movieReview) throws Exception {

		System.out.println( "영화 평점 test중 "+ movieReview.getMovie_review_rate());
		
		System.out.print(movieReview.getMovie_id() + movieReview.getMovie_review_content()
				+ movieReview.getMovie_review_rate() + movieReview.getMem_id());

		Map<String, Object> success = new HashMap<>();

		int i = movieReviewService.insertMovieReview(movieReview);

		success.put("success", i);

		System.out.println("영화 아이디  이렇게 날아감 : " + movieReview.getMovie_id());
		System.out.println("영화 리뷰 내용  이렇게 날아감 : " + movieReview.getMovie_review_content());
		System.out.println("영화 리뷰 평가  이렇게 날아감 : " + movieReview.getMovie_review_rate());
		System.out.println("영화 멤버아이디  이렇게 날아감 : " + movieReview.getMem_id());
		System.out.println("영화 리뷰1 이렇게 날아감 : " + movieReview.getMovie_id());
		System.out.println("영화 리뷰1 이렇게 날아감 : " + movieReview.getMovie_review_id());

		return success;
	}

	@RequestMapping("/selectListReview")
	@ResponseBody
	private Map<String, Object> movieReviewList(MovieReview movieReview) {

		List<MovieReview> movieReviewList = new ArrayList<>();

		movieReviewList = movieReviewService.selectReviewList(movieReview.getMovie_id());


		Map<String, Object> success = new HashMap<>();

		success.put("movieReviewList", movieReviewList);

		return success;
		
	}


	@RequestMapping("/selectMovieList")
	@ResponseBody
	public List<Movie> moviePosterMore(@RequestParam Map<String, Object>params,
			 @RequestParam(value = "currentPage" , required = false, defaultValue = "1" )int currentPage,
			 @RequestParam(value = "pageSize", required = false, defaultValue = "6" ) int pageSize)
				throws Exception {
		
		
		System.out.println("파람스에 담긴 sortValue 값 : "+params.get("sortValue"));
		System.out.println("파람스에 담긴 sortValue 값 : "+params.get("sortValue"));
		System.out.println("파람스에 담긴 sortValue 값 : "+params.get("sortValue"));
		
		
		int totalCount = 0;
		
		totalCount = movieService.getMovieCount(params);
		
		MoviePaging moviePaging = new MoviePaging(totalCount, pageSize, currentPage);
		
		System.out.println(moviePaging.getStartRow());
		System.out.println(moviePaging.getEndRow());
		
		params.put("startRow", moviePaging.getStartRow());
		params.put("endRow", moviePaging.getEndRow());
		
		List<Movie> movieList = movieService.selectMovieListWithPaging(params);
		
		
			return movieList;
		
		}
	
	//스틸컷 
	/*@RequestMapping("/selectStillCutList/{movie_id}")
	public String selectStillCutList(int movie_id , Model model) {
		
		List<Movie> stillcutList = new ArrayList<>();
	
		Movie movie = movieService.selectStillCutList(movie_id);
		
		model.addAttribute("stillcutList", stillcutList);
		
		
		return "movie/movie_detail";
	}
	*/
	
	@RequestMapping("/fileUploadForm")
	public String fileUploadForm() {
		
		
		return "movie/fileUploadForm";
	}
	
	@RequestMapping("/fileUpload")
	public String fileUpload() {
		
		
		return "movie/fileUpload";
	}
	
	@RequestMapping("/fileCheck")
	public String fileCheck() {
		
		
		return "movie/fileCheck";
	}
	
	
	
	
	
}

	
	
	
	
	
	
	
	
	

