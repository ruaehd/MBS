package com.mbs.mvc.vo;

public class QNAVO {
	private int qst_no = 0;
	private String qst_title = null;
	private String qst_content = null;
	private int qst_hit = 0;
	private String qst_date = null;
	private String mb_id = null;
	private byte[] qst_img = null;
	private String qst_code = null;
	
	public String getQst_code() {
		return qst_code;
	}
	public void setQst_code(String qst_code) {
		this.qst_code = qst_code;
	}
	public byte[] getQst_img() {
		return qst_img;
	}
	public void setQst_img(byte[] qst_img) {
		this.qst_img = qst_img;
	}
	public int getQst_no() {
		return qst_no;
	}
	public void setQst_no(int qst_no) {
		this.qst_no = qst_no;
	}
	public String getQst_title() {
		return qst_title;
	}
	public void setQst_title(String qst_title) {
		this.qst_title = qst_title;
	}
	public String getQst_content() {
		return qst_content;
	}
	public void setQst_content(String qst_content) {
		this.qst_content = qst_content;
	}
	public int getQst_hit() {
		return qst_hit;
	}
	public void setQst_hit(int qst_hit) {
		this.qst_hit = qst_hit;
	}
	public String getQst_date() {
		return qst_date;
	}
	public void setQst_date(String qst_date) {
		this.qst_date = qst_date;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
}