package kr.co.gdfm.board.model;

public class Comment {	
	private int bo_co_id;
	private String mem_id;
	private String bo_co_content;
	private String bo_co_reg_date;
	private String bo_co_upd_date;
	private String bo_co_upd_user;
	private int bo_id;
	
	public int getBo_co_id() {
		return bo_co_id;
	}
	public void setBo_co_id(int bo_co_id) {
		this.bo_co_id = bo_co_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBo_co_content() {
		return bo_co_content;
	}
	public void setBo_co_content(String bo_co_content) {
		this.bo_co_content = bo_co_content;
	}
	public String getBo_co_reg_date() {
		return bo_co_reg_date;
	}
	public void setBo_co_reg_date(String bo_co_reg_date) {
		this.bo_co_reg_date = bo_co_reg_date;
	}
	public String getBo_co_upd_date() {
		return bo_co_upd_date;
	}
	public void setBo_co_upd_date(String bo_co_upd_date) {
		this.bo_co_upd_date = bo_co_upd_date;
	}
	public String getBo_co_upd_user() {
		return bo_co_upd_user;
	}
	public void setBo_co_upd_user(String bo_co_upd_user) {
		this.bo_co_upd_user = bo_co_upd_user;
	}
	public int getBo_id() {
		return bo_id;
	}
	public void setBo_id(int bo_id) {
		this.bo_id = bo_id;
	}
}
