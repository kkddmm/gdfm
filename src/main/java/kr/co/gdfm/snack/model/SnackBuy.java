package kr.co.gdfm.snack.model;

public class SnackBuy {
	
	
	private int snack_id;
	private String mem_id;
	private String snack_name;
	private int snack_buy_id;
	private int snack_cnt;	
	private String pay_id;
	private String snack_isbasket_yn;
	private int snack_price;
	
	private String snack_use_yn;
	private String snack_use_date;
	
	private String mem_name;
	private int mem_point;
	private String pay_canel_yn;
	private String pay_amount;
	private String pay_date;
	
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
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
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
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
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
	public String getSnack_use_yn() {
		return snack_use_yn;
	}
	public void setSnack_use_yn(String snack_use_yn) {
		this.snack_use_yn = snack_use_yn;
	}
	public String getSnack_use_date() {
		return snack_use_date;
	}
	public void setSnack_use_date(String snack_use_date) {
		this.snack_use_date = snack_use_date;
	}
	public String getPay_date() {
		return pay_date;
	}	
	
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	
	
	
}

