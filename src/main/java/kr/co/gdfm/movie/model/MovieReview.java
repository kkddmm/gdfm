package kr.co.gdfm.movie.model;

public class MovieReview {

	   	private int movie_review_id;
	    private int movie_id;
	    private String mem_id;
	    private String movie_review_content;
	    private float movie_review_rate;
	    private String review_reg_date;
	    
	    
		public int getMovie_review_id() {
			return movie_review_id;
		}
		public void setMovie_review_id(int movie_review_id) {
			this.movie_review_id = movie_review_id;
		}
		public int getMovie_id() {
			return movie_id;
		}
		public void setMovie_id(int movie_id) {
			this.movie_id = movie_id;
		}
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}
		public String getMovie_review_content() {
			return movie_review_content;
		}
		public void setMovie_review_content(String movie_review_content) {
			this.movie_review_content = movie_review_content;
		}
		public float getMovie_review_rate() {
			return movie_review_rate;
		}
		public void setMovie_review_rate(float movie_review_rate) {
			this.movie_review_rate = movie_review_rate;
		}
		public String getReview_reg_date() {
			return review_reg_date;
		}
		public void setReview_reg_date(String review_reg_date) {
			this.review_reg_date = review_reg_date;
		}
		
	    
	    
		
	    
	    
	
}
