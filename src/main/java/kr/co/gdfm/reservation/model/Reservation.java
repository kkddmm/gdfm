package kr.co.gdfm.reservation.model;

public class Reservation {

	private int reservation_id;
	private String mem_id;
	private int show_id;
	private String reservation_reg_date;
	private String pay_id; //null 값이 들어갈 수 있기 때문에.
	
	private String mem_name;
	private int mem_point;
	private String movie_name;
	private String movie_ko_name;
	private String pay_canel_yn;
	private String pay_amount;
	private String reservationcount;
	private String show_date;
	
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getShow_id() {
		return show_id;
	}
	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}
	public String getReservation_reg_date() {
		return reservation_reg_date;
	}
	public void setReservation_reg_date(String reservation_reg_date) {
		this.reservation_reg_date = reservation_reg_date;
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
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
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public String getPay_canel_yn() {
		return pay_canel_yn;
	}
	public void setPay_canel_yn(String pay_canel_yn) {
		this.pay_canel_yn = pay_canel_yn;
	}
	public String getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}
	public String getReservationcount() {
		return reservationcount;
	}
	public void setReservationcount(String reservationcount) {
		this.reservationcount = reservationcount;
	}
	public String getShow_date() {
		return show_date;
	}
	public void setShow_date(String show_date) {
		this.show_date = show_date;
	}
}
