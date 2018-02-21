package kr.co.gdfm.snack.model;

public class SnackBuy {
	
	
	private int snack_id;
	private String mem_id;
	private String snack_name;
	private int snack_buy_id;
	private int snack_cnt;	
	private int pay_id;
	private String snack_isbasket_yn;
	private int snack_price;
	
	
	public int getSnack_id() {
		return snack_id;
	}
	public void setSnack_id(int snack_id) {
		this.snack_id = snack_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public void setSnack_name(String snack_name) {
		this.snack_name = snack_name;
	}
	
	
	public int getSnack_buy_id() {
		return snack_buy_id;
	}
	public void setSnack_buy_id(int snack_buy_id) {
		this.snack_buy_id = snack_buy_id;
	}
	public int getSnack_cnt() {
		return snack_cnt;
	}
	public void setSnack_cnt(int snack_cnt) {
		this.snack_cnt = snack_cnt;
	}
	public int getPay_id() {
		return pay_id;
	}
	public void setPay_id(int pay_id) {
		this.pay_id = pay_id;
	}
	public String getSnack_isbasket_yn() {
		return snack_isbasket_yn;
	}
	public void setSnack_isbasket_yn(String snack_isbasket_yn) {
		this.snack_isbasket_yn = snack_isbasket_yn;
	}
	public int getSnack_price() {
		return snack_price;
	}
	public void setSnack_price(int snack_price) {
		this.snack_price = snack_price;
	}
	public String getSnack_name() {
		return snack_name;
	}
	
	
	
}

