package com.mbs.mvc.vo;

public class V1_AdminReviewVO {
	private int rsv_no = 0, rsv_cmt_no = 0;
	private String str_number = null,str_name = null,rsv_cmt_writer = null,
	rsv_cmt_content = null,rsv_cmt_point = null,rsv_cmt_date = null;
	
	public String getRsv_cmt_writer() {
		return rsv_cmt_writer;
	}
	public void setRsv_cmt_writer(String rsv_cmt_writer) {
		this.rsv_cmt_writer = rsv_cmt_writer;
	}
	public String getStr_name() {
		return str_name;
	}
	public void setStr_name(String str_name) {
		this.str_name = str_name;
	}
	public int getRsv_no() {
		return rsv_no;
	}
	public void setRsv_no(int rsv_no) {
		this.rsv_no = rsv_no;
	}
	public int getRsv_cmt_no() {
		return rsv_cmt_no;
	}
	public void setRsv_cmt_no(int rsv_cmt_no) {
		this.rsv_cmt_no = rsv_cmt_no;
	}
	public String getStr_number() {
		return str_number;
	}
	public void setStr_number(String str_number) {
		this.str_number = str_number;
	}
	public String getRsv_cmt_content() {
		return rsv_cmt_content;
	}
	public void setRsv_cmt_content(String rsv_cmt_content) {
		this.rsv_cmt_content = rsv_cmt_content;
	}
	public String getRsv_cmt_point() {
		return rsv_cmt_point;
	}
	public void setRsv_cmt_point(String rsv_cmt_point) {
		this.rsv_cmt_point = rsv_cmt_point;
	}
	public String getRsv_cmt_date() {
		return rsv_cmt_date;
	}
	public void setRsv_cmt_date(String rsv_cmt_date) {
		this.rsv_cmt_date = rsv_cmt_date;
	}
	
	
}
