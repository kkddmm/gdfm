package kr.co.gdfm.reservation.model;

public class MovieShowInfo {

	private int show_id;
	private int ci_id;
	private int screen_id;
	private String screen_name;
	private String start_time;
	private String end_time;
	private String dimension_name;
	private int sit;//남은좌석
	
	
	public int getShow_id() {
		return show_id;
	}
	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}
	public int getCi_id() {
		return ci_id;
	}
	public void setCi_id(int ci_id) {
		this.ci_id = ci_id;
	}
	public int getScreen_id() {
		return screen_id;
	}
	public void setScreen_id(int screen_id) {
		this.screen_id = screen_id;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getDimension_name() {
		return dimension_name;
	}
	public void setDimension_name(String dimension_name) {
		this.dimension_name = dimension_name;
	}
	public int getSit() {
		return sit;
	}
	public void setSit(int sit) {
		this.sit = sit;
	}
	
	
	

}
