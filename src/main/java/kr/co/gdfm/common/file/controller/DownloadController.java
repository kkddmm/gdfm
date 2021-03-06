package kr.co.gdfm.common.file.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdfm.common.file.model.FileItem;
import kr.co.gdfm.common.file.service.FileItemService;
import kr.co.gdfm.common.util.ConstantUtil;


@Controller
public class DownloadController {

	@Autowired
	FileItemService fileItemService;

	@RequestMapping("/common/download")
	public void process(
			@RequestParam(value="file_id", required=true, defaultValue="0") int file_id, 
			HttpServletResponse response) throws Exception {
		try {
			response.reset();

			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("file_id", file_id);

			FileItem fileItem = fileItemService.getFileItem(paramMap);

			if (fileItem == null) {
				throw new RuntimeException("해당 파일이 존재하지 않습니다.");
			}

			// 응답 헤더 정보 변경.
			response.setHeader("Content-Type", "application/octet-stream");

			// Content-Disposition
			String fileName = URLEncoder.encode(fileItem.getFile_name(), "utf-8");
			
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");

			// Content-Transfer-Encoding
			response.setHeader("Content-Transfer-Encoding", "binary");

			// 컨텐트 사이즈
			response.setContentLength((int) fileItem.getFile_size());

			// 캐쉬관련
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "-1");

			// 파일전송
			File saveFile = new File(
					ConstantUtil.UPLOAD_PATH + "/" + fileItem.getFile_path() + "/" + fileItem.getFile_save_name());

			if (!saveFile.exists()) {
				throw new RuntimeException("해당 파일이 존재하지 않습니다.");
			}

			// 응답 데이터로 파일 전송.
			FileUtils.copyFile(saveFile, response.getOutputStream());
			response.getOutputStream().close();

		} catch (Exception e) {
			e.printStackTrace();
			response.reset();
			response.setStatus(HttpServletResponse.SC_FOUND); // 404에러.
		}

		return;
	}
	
	
	/*@RequestMapping("/loadImg")
	public void loadImage(int movie_id , HttpServletResponse resp) {
		
		File file = new File("/uploadFiles/Movie/"+movie_id+"_poster.jpg");
		try {
		FileUtils.copyFile(file, resp.getOutputStream());
			resp.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}*/
	
	
	@RequestMapping("/uploadImg/{path}/{imagename:.+}")
	public void loadImage(@PathVariable("path")String path ,@PathVariable( "imagename" )String imagename, HttpServletResponse resp) {
		
		
		File file = new File("/uploadFiles/"+path+"/" +imagename);
		try {
		FileUtils.copyFile(file, resp.getOutputStream());
			resp.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
			}
		
		}
	
	
	@RequestMapping("/uploadMovieImg/{path}/{movie_file_name}")
	public void loadMovieImage(@PathVariable("path")String path ,@PathVariable("movie_file_name")String movie_file_name, HttpServletResponse resp) {
		
		
		System.out.println(path);
		System.out.println(movie_file_name);
		
	String ffff=String.format("/uploadFiles/%s/%s_poster.jpg",path,movie_file_name );
		
		
		
		
		File file = new File(ffff);

	
		try {
		FileUtils.copyFile(file, resp.getOutputStream());
		
		resp.setContentType("application/x-msdownload");            
		resp.setHeader("Content-disposition", "attachment; filename="+ "jkkkkkkkkkkkkkkkkkk.jpg");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			try {
				resp.getOutputStream().close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
			}
		}
	}
}
		
	
	
	
	
	
	
	


