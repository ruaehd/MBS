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
	private int qst_open = 0;

	/*search*/
	private String qst_type = null;
	private String qst_text = null;
	private String qst_sel_type = null;
	private int qst_page = 0;
	
	
	
	public int getQst_page() {
		return qst_page;
	}
	public void setQst_page(int qst_page) {
		this.qst_page = qst_page;
	}
	public String getQst_sel_type() {
		return qst_sel_type;
	}
	public void setQst_sel_type(String qst_sel_type) {
		this.qst_sel_type = qst_sel_type;
	}
	public String getQst_type() {
		return qst_type;
	}
	public void setQst_type(String qst_type) {
		this.qst_type = qst_type;
	}
	public String getQst_text() {
		return qst_text;
	}
	public void setQst_text(String qst_text) {
		this.qst_text = qst_text;
	}
	public int getQst_open() {
		return qst_open;
	}
	public void setQst_open(int qst_open) {
		this.qst_open = qst_open;
	}
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