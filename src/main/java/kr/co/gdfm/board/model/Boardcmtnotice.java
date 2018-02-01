package kr.co.gdfm.board.model;

import java.util.List;

import kr.co.gdfm.common.file.model.FileItem;


public class Boardcmtnotice {
	
	private int notice_id;
	private int bo_co_id;
	private String notice_check_yn;
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public int getBo_co_id() {
		return bo_co_id;
	}
	public void setBo_co_id(int bo_co_id) {
		this.bo_co_id = bo_co_id;
	}
	public String getNotice_check_yn() {
		return notice_check_yn;
	}
	public void setNotice_check_yn(String notice_check_yn) {
		this.notice_check_yn = notice_check_yn;
	}
}
