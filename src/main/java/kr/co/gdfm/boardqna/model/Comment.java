package kr.co.gdfm.boardqna.model;

public class Comment {

	private int co_id;
	private String co_writer; 
	private String parent_bo_id;
	private String parent_co_id;
	private String co_content;
	private String reg_date;
	
	
	

	public String getParent_bo_id() {
		return parent_bo_id;
	}
	public void setParent_bo_id(String parent_bo_id) {
		this.parent_bo_id = parent_bo_id;
	}
	public String getParent_co_id() {
		return parent_co_id;
	}
	public void setParent_co_id(String parent_co_id) {
		this.parent_co_id = parent_co_id;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getCo_id() {
		return co_id;
	}
	public void setCo_id(int co_id) {
		this.co_id = co_id;
	}
	public String getCo_writer() {
		return co_writer;
	}
	public void setCo_writer(String co_writer) {
		this.co_writer = co_writer;
	}

}
