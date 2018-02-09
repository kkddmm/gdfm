package kr.co.gdfm.main.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	BoardService boardService;
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
