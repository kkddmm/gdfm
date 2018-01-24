package kr.co.gdfm.movie.model;

import java.util.Date;

//영화 
public class Movie {

 // 영화id 
 private Integer movieId;

 // 영화이름 
 private String movieName;

 // 영화장르code 
 private Integer movieGenreCode;

 // 상영등급 
 private String movieGrade;

 // 영화줄거리 
 private String movieStory;

 // 영화트레일러 
 private String movieTrailer;

 // 영화상영여부 
 private String movieShowYn;

 // 영화개봉일 
 private Date movieReleaseDate;

 // 영화관람가격 
 private Integer moviePrice;

 // 영화차원종류 
 private String movieDemension;

 public Integer getMovieId() {
     return movieId;
 }

 public void setMovieId(Integer movieId) {
     this.movieId = movieId;
 }

 public String getMovieName() {
     return movieName;
 }

 public void setMovieName(String movieName) {
     this.movieName = movieName;
 }

 public Integer getMovieGenreCode() {
     return movieGenreCode;
 }

 public void setMovieGenreCode(Integer movieGenreCode) {
     this.movieGenreCode = movieGenreCode;
 }

 public String getMovieGrade() {
     return movieGrade;
 }

 public void setMovieGrade(String movieGrade) {
     this.movieGrade = movieGrade;
 }

 public String getMovieStory() {
     return movieStory;
 }

 public void setMovieStory(String movieStory) {
     this.movieStory = movieStory;
 }

 public String getMovieTrailer() {
     return movieTrailer;
 }

 public void setMovieTrailer(String movieTrailer) {
     this.movieTrailer = movieTrailer;
 }

 public String getMovieShowYn() {
     return movieShowYn;
 }

 public void setMovieShowYn(String movieShowYn) {
     this.movieShowYn = movieShowYn;
 }

 public Date  getMovieReleaseDate() {
     return movieReleaseDate;
 }

 public void setMovieReleaseDate(Date movieReleaseDate) {
     this.movieReleaseDate = movieReleaseDate;
 }

 public Integer getMoviePrice() {
     return moviePrice;
 }

 public void setMoviePrice(Integer moviePrice) {
     this.moviePrice = moviePrice;
 }

 public String getMovieDemension() {
     return movieDemension;
 }

 public void setMovieDemension(String movieDemension) {
     this.movieDemension = movieDemension;
 }

 // Movie 모델 복사
 public void CopyData(Movie param)
 {
     this.movieId = param.getMovieId();
     this.movieName = param.getMovieName();
     this.movieGenreCode = param.getMovieGenreCode();
     this.movieGrade = param.getMovieGrade();
     this.movieStory = param.getMovieStory();
     this.movieTrailer = param.getMovieTrailer();
     this.movieShowYn = param.getMovieShowYn();
     this.movieReleaseDate = param.getMovieReleaseDate();
     this.moviePrice = param.getMoviePrice();
     this.movieDemension = param.getMovieDemension();
 }
}