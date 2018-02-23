package kr.co.gdfm.main.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.gdfm.board.model.Board;
import kr.co.gdfm.board.service.BoardService;
import kr.co.gdfm.common.util.PagingUtil;
import kr.co.gdfm.main.service.MainService;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.movie.model.Movie;

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/main")
	public String goMain(
			//@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			//@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,			
			Model model
			) throws Exception {
		int pageCount = 5;	//기본값
		int totalCount = 0;
		Map<String, Object> paramMap = new HashMap<>();
		// 총 게시글 수
		paramMap.put("bo_type_code", 1);
		totalCount = boardService.getBoardCount(paramMap);
				
				// 페이징 처리
		PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
		
	
		
//		if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank( searchWord )) {
//			paramMap.put("searchType", searchType);
//			paramMap.put("searchWord", searchWord);
//		}
		
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		List<Board> mainList = boardService.getBoardList(paramMap); 
		

			
		model.addAttribute("mainList", mainList);
		
		
		return "main/main";
	}
	
	@RequestMapping("/recommendMovieChart")	
	@ResponseBody
	public Map<String, Object> getRecommendMovieChart(
			HttpSession session,  
//			@RequestParam(value="mem_id", required=false) String mem_id, 
//			@RequestParam(value="movie_show_yn", required=true) String movie_show_yn, 
			Model model
			) throws Exception {
		Member member = null;
		member=(Member)session.getAttribute("LOGIN_USER");
		
		
		Movie movie = null;
		
		
		List<Movie> movieList = null;
		Map<String, Object> recommendList= new HashMap<>();
		
				//&&StringUtils.isNotBlank(member.getMem_id())
		if( member!=null) {
			movieList=mainService.getMainMovieChartWithLogin(member); //로그인 한 사용자 영화추천 리스트
		}else {
			movieList=mainService.getMainMovieChartWithNoLogin(); //로그인 안 했을 때 예매율 순위 영화 리스트
		}
		
//		movieList=mainService.getMainMovieChartWithNoLogin(); 
		
		recommendList.put("movieList", movieList);
		
		return recommendList;		
	}
	
	@RequestMapping("/mainOpenMovieChart")
	@ResponseBody
	public Map<String, Object> getOpenMovieChart(			  
//				@RequestParam(value="movie_release_date", required=true) String movie_release_date, Model model
			) throws Exception {
		
	
		Map<String, Object> openMap = new HashMap<>();
		List<Movie> openMovieList = null;
	
			openMovieList=mainService.mainOpenMovieList(); 
				//openMovieList 자체를 return 하면 안되나?
			openMap.put("openMovieList", openMovieList);
		return openMap;		
	}
	
	
	//개봉예정 영화
	@RequestMapping("/mainPreMovieChart")
	@ResponseBody
	public Map<String, Object> getPreMovieChart(							
			) throws Exception {
		
		Map<String, Object> preMap = new HashMap<>();
		List<Movie> preMovieList = null;
		
		preMovieList=mainService.mainPreMovieList();
		
		preMap.put("preMovieList", preMovieList);	
		
		return preMap;		
	}
	
	@RequestMapping("/mainMovieDay")
	@ResponseBody
	public Map<String, Object> mainMovieDay() throws Exception {
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE , -1);
		String beforeDate = new java.text.SimpleDateFormat("yyyyMMdd").format(day.getTime());
			
		String reqUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=50c6691f47b0c21cfd56c8a432d9ab37&targetDt="+beforeDate;
			
			URL url = new URL(reqUrl);
			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			
			Gson gson = new Gson();
			Map resultMap = gson.fromJson(new InputStreamReader(is,  "UTF-8"), Map.class);
			Map boxMap = (Map) resultMap.get("boxOfficeResult");
			return boxMap;
		
	}
	
	@RequestMapping("/mainMovieWeek")
	@ResponseBody
	public Map<String, Object> mainMovieWeek() throws Exception {
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE , -5);
		String weekDate = new java.text.SimpleDateFormat("yyyyMMdd").format(day.getTime());
		
		String reqUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=50c6691f47b0c21cfd56c8a432d9ab37&targetDt="+weekDate;
		
		URL url = new URL(reqUrl);
		URLConnection conn = url.openConnection();
		InputStream is = conn.getInputStream();
		
		Gson gson = new Gson();
		Map resultMap = gson.fromJson(new InputStreamReader(is,  "UTF-8"), Map.class);
		Map boxMap = (Map) resultMap.get("boxOfficeResult");
		return boxMap;
		
	}

	@RequestMapping("/mainMovieNew")
	@ResponseBody
	public Map<String, Object> mainMovieNew() throws Exception {
		String reqUrl = "http://movie.daum.net/magazine/movienews/";
		
			InputStream is = new URL(reqUrl).openStream(); // openConnect() + getInputStream()
			
			Document doc = Jsoup.parse(is, "UTF-8", reqUrl); // 자바스크립트가능, 스크립트단 불러오기불가능
			
			Elements liList = doc.select("ul.list_magazine > li");
			//System.out.println( liList.size() );
			Map<String, Object> movienewMap = new HashMap<>();
			List<String> movienewList = new ArrayList<>();
			List<String> movienewList2 = new ArrayList<>();
			List<String> movienewList3 = new ArrayList<>();
			List<String> movienewList4 = new ArrayList<>();
			//int i=1;
			//int i2=1;
			//int i3=1;
			for(Element li : liList) {
				Element link = li.selectFirst("span.magazine_img");
				Element link2 = li.selectFirst("strong.tit_magazine");
				Element link3 = li.selectFirst("span.txt_magazine");
				Element link4 = li.selectFirst("a.link_magazine");
				
				//System.out.println( link.attr("style").split("[() ]")[1] );
				//System.out.println( link2.text() );
				//System.out.println( link3.text() );
				//System.out.println( link4.attr("herf") );
				movienewList.add(link.attr("style").split("[() ]")[1]);
				movienewList2.add(link2.text());
				movienewList3.add(link3.text());
				movienewList4.add(link4.attr("href"));
				movienewMap.put("movienewList", movienewList);
				movienewMap.put("movienewList2", movienewList2);
				movienewMap.put("movienewList3", movienewList3);
				movienewMap.put("movienewList4", movienewList4);
			
			}
			return movienewMap;
	}
	
	
}
