package kr.co.gdfm.movie.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

 
public class Movie {

	private int  movie_id;
	private String movie_name;
	private String movie_ko_name;
	private String movie_grade;
	private String movie_story;
	private String movie_snapshoot;
	private String movie_show_yn;
	private int  movie_dimension_code;
	private String movie_release_date;
	private String movie_director;
	private String movie_actor;
	private String movie_running_time;
	private String movie_production_country;
	private String movie_trailer;
	private List<String> movie_genre_name;
	private String dimension_name;
	private MultipartFile poster_file;
	//스틸 컷 
	private List<String> 	stillcut;
	private MultipartFile[] stillcut_file;
	private int rnum;	
	
	
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public MultipartFile[] getStillcut_file() {
		return stillcut_file;
	}
	public void setStillcut_file(MultipartFile[] stillcut_file) {
		this.stillcut_file = stillcut_file;
	}
	public MultipartFile getPoster_file() {
		return poster_file;
	}
	public void setPoster_file(MultipartFile poster_file) {
		this.poster_file = poster_file;
	}
	
	

	public String getDimension_name() {
		return dimension_name;
	}
	public void setDimension_name(String dimension_name) {
		this.dimension_name = dimension_name;
	}
	
	
	public List<String> getStillcut() {
		return stillcut;
	}
	public void setStillcut(List<String> stillcut) {
		this.stillcut = stillcut;
	}
	public List<String> getMovie_genre_name() {
		return movie_genre_name;
	}
	public void setMovie_genre_name(List<String> movie_genre_name) {
		this.movie_genre_name = movie_genre_name;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_ko_name() {
		return movie_ko_name;
	}
	public void setMovie_ko_name(String movie_ko_name) {
		this.movie_ko_name = movie_ko_name;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_story() {
		return movie_story;
	}
	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}
	public String getMovie_snapshoot() {
		return movie_snapshoot;
	}
	public void setMovie_snapshoot(String movie_snapshoot) {
		this.movie_snapshoot = movie_snapshoot;
	}
	public String getMovie_show_yn() {
		return movie_show_yn;
	}
	public void setMovie_show_yn(String movie_show_yn) {
		this.movie_show_yn = movie_show_yn;
	}
	public int getMovie_dimension_code() {
		return movie_dimension_code;
	}
	public void setMovie_dimension_code(int movie_dimension_code) {
		this.movie_dimension_code = movie_dimension_code;
	}
	public String getMovie_release_date() {
		return movie_release_date;
	}
	public void setMovie_release_date(String movie_release_date) {
		this.movie_release_date = movie_release_date;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public String getMovie_running_time() {
		return movie_running_time;
	}
	public void setMovie_running_time(String movie_running_time) {
		this.movie_running_time = movie_running_time;
	}
	public String getMovie_production_country() {
		return movie_production_country;
	}
	public void setMovie_production_country(String movie_production_country) {
		this.movie_production_country = movie_production_country;
	}
	public String getMovie_trailer() {
		return movie_trailer;
	}
	public void setMovie_trailer(String movie_trailer) {
		this.movie_trailer = movie_trailer;
	}
	
}
