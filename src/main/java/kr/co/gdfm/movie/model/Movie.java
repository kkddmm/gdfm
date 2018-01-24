package kr.co.gdfm.movie.model;

import java.util.Date;

//영화 
public class Movie {

	private int Movie_id;
	private String Movie_name;
	private int Movie_genre_code;
	private String Movie_grade;
	private String Movie__story;
	private String Movie_trailer;
	private String Movie_show_yn;
	private String Movie_release_date;
	private int Movie_price;
	private String Movie_demension;
	private String Movie_ko_name;
	public int getMovie_id() {
		return Movie_id;
	}
	public void setMovie_id(int movie_id) {
		Movie_id = movie_id;
	}
	public String getMovie_name() {
		return Movie_name;
	}
	public void setMovie_name(String movie_name) {
		Movie_name = movie_name;
	}
	public int getMovie_genre_code() {
		return Movie_genre_code;
	}
	public void setMovie_genre_code(int movie_genre_code) {
		Movie_genre_code = movie_genre_code;
	}
	public String getMovie_grade() {
		return Movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		Movie_grade = movie_grade;
	}
	public String getMovie__story() {
		return Movie__story;
	}
	public void setMovie__story(String movie__story) {
		Movie__story = movie__story;
	}
	public String getMovie_trailer() {
		return Movie_trailer;
	}
	public void setMovie_trailer(String movie_trailer) {
		Movie_trailer = movie_trailer;
	}
	public String getMovie_show_yn() {
		return Movie_show_yn;
	}
	public void setMovie_show_yn(String movie_show_yn) {
		Movie_show_yn = movie_show_yn;
	}
	public String getMovie_release_date() {
		return Movie_release_date;
	}
	public void setMovie_release_date(String movie_release_date) {
		Movie_release_date = movie_release_date;
	}
	public int getMovie_price() {
		return Movie_price;
	}
	public void setMovie_price(int movie_price) {
		Movie_price = movie_price;
	}
	public String getMovie_demension() {
		return Movie_demension;
	}
	public void setMovie_demension(String movie_demension) {
		Movie_demension = movie_demension;
	}
	public String getMovie_ko_name() {
		return Movie_ko_name;
	}
	public void setMovie_ko_name(String movie_ko_name) {
		Movie_ko_name = movie_ko_name;
	}

}
