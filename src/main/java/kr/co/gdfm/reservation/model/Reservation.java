package kr.co.gdfm.reservation.model;

public class Reservation {

	private int reservation_id;
	private String mem_id;
	private int show_id;
	private String reservation_reg_date;
	private Integer pay_id; //null 값이 들어갈 수 있기 때문에.
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
	public Integer getPay_id() {
		return pay_id;
	}
	public void setPay_id(Integer pay_id) {
		this.pay_id = pay_id;
	}

	
	
	
	
	
}
