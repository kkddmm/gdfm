package kr.co.gdfm.main.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String goMain() {
		
		
		
		return "main/main";
	}
	
	@RequestMapping("/mainMovieApi")
	@ResponseBody
	public Map<String, Object> mainMovieApi() throws Exception {
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
