package com.mbs.mvc.vo;

public class NoticeVO {
	private int ntc_no = 0;
	private String ntc_title = null;
	private String ntc_content = null;
	private int ntc_hit = 0;
	private int ntc_delete = 0;
	private String ntc_date = null;
	private String mb_id = null;
	public String getNtc_content() {
		return ntc_content;
	}
	public void setNtc_content(String ntc_content) {
		this.ntc_content = ntc_content;
	}
	public int getNtc_no() {
		return ntc_no;
	}
	public void setNtc_no(int ntc_no) {
		this.ntc_no = ntc_no;
	}
	public String getNtc_title() {
		return ntc_title;
	}
	public void setNtc_title(String ntc_title) {
		this.ntc_title = ntc_title;
	}
	public int getNtc_hit() {
		return ntc_hit;
	}
	public void setNtc_hit(int ntc_hit) {
		this.ntc_hit = ntc_hit;
	}
	public int getNtc_delete() {
		return ntc_delete;
	}
	public void setNtc_delete(int ntc_delete) {
		this.ntc_delete = ntc_delete;
	}
	public String getNtc_date() {
		return ntc_date;
	}
	public void setNtc_date(String ntc_date) {
		this.ntc_date = ntc_date;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
}
