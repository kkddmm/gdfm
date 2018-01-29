package kr.co.gdfm.boardqna.model;

import java.util.List;

import kr.co.gdfm.common.file.model.FileItem;


public class Boardqna {
	private int bo_id;
	private String bo_type;
	private String mem_id;
	private String mem_id_name;
	private int ci_id;
	private String ci_id_name;
	private String bo_title;
	private String bo_content;
	private int bo_hit_cnt;
	private String bo_notice_yn;
	private String bo_delete_yn;
	private String bo_reg_date;
	private String bo_upd_date;
	private String bo_upd_user;
	
	private List<FileItem> fileItemList;
	
	private String[] delFileSeqNo;
	
	public int getBo_id() {
		return bo_id;
	}
	public void setBo_id(int bo_id) {
		this.bo_id = bo_id;
	}
	public String getBo_type() {
		return bo_type;
	}
	public void setBo_type(String bo_type) {
		this.bo_type = bo_type;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCi_id() {
		return ci_id;
	}
	public void setCi_id(int ci_id) {
		this.ci_id = ci_id;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public int getBo_hit_cnt() {
		return bo_hit_cnt;
	}
	public void setBo_hit_cnt(int bo_hit_cnt) {
		this.bo_hit_cnt = bo_hit_cnt;
	}
	public String getBo_notice_yn() {
		return bo_notice_yn;
	}
	public void setBo_notice_yn(String bo_notice_yn) {
		this.bo_notice_yn = bo_notice_yn;
	}
	public String getBo_delete_yn() {
		return bo_delete_yn;
	}
	public void setBo_delete_yn(String bo_delete_yn) {
		this.bo_delete_yn = bo_delete_yn;
	}
	public String getBo_reg_date() {
		return bo_reg_date;
	}
	public void setBo_reg_date(String bo_reg_date) {
		this.bo_reg_date = bo_reg_date;
	}
	public String getBo_upd_date() {
		return bo_upd_date;
	}
	public void setBo_upd_date(String bo_upd_date) {
		this.bo_upd_date = bo_upd_date;
	}
	public String getBo_upd_user() {
		return bo_upd_user;
	}
	public void setBo_upd_user(String bo_upd_user) {
		this.bo_upd_user = bo_upd_user;
	}
	public String getMem_id_name() {
		return mem_id_name;
	}
	public void setMem_id_name(String mem_id_name) {
		this.mem_id_name = mem_id_name;
	}
	public List<FileItem> getFileItemList() {
		return fileItemList;
	}
	public void setFileItemList(List<FileItem> fileItemList) {
		this.fileItemList = fileItemList;
	}
	public String[] getDelFileSeqNo() {
		return delFileSeqNo;
	}
	public void setDelFileSeqNo(String[] delFileSeqNo) {
		this.delFileSeqNo = delFileSeqNo;
	}
	public String getCi_id_name() {
		return ci_id_name;
	}
	public void setCi_id_name(String ci_id_name) {
		this.ci_id_name = ci_id_name;
	}
	
}
