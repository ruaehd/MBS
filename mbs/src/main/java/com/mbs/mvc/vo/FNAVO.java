package com.mbs.mvc.vo;

public class FNAVO {
	private int fna_no = 0;
	private String fna_title = null;
	private String fna_content = null;
	private int fna_code = 0;
	private int fna_delete = 0;
	private String fna_date = null;
	private String mb_id = null;
	/* search */
	private String fna_sc_type = null;
	private String fna_sc_text = null;
	private int fna_page = 0;
	
	public int getFna_page() {
		return fna_page;
	}
	public void setFna_page(int fna_page) {
		this.fna_page = fna_page;
	}
	public String getFna_sc_type() {
		return fna_sc_type;
	}
	public void setFna_sc_type(String fna_sc_type) {
		this.fna_sc_type = fna_sc_type;
	}
	public String getFna_sc_text() {
		return fna_sc_text;
	}
	public void setFna_sc_text(String fna_sc_text) {
		this.fna_sc_text = fna_sc_text;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getFna_no() {
		return fna_no;
	}
	public void setFna_no(int fna_no) {
		this.fna_no = fna_no;
	}
	public String getFna_title() {
		return fna_title;
	}
	public void setFna_title(String fna_title) {
		this.fna_title = fna_title;
	}
	public String getFna_content() {
		return fna_content;
	}
	public void setFna_content(String fna_content) {
		this.fna_content = fna_content;
	}
	public int getFna_code() {
		return fna_code;
	}
	public void setFna_code(int fna_code) {
		this.fna_code = fna_code;
	}
	public int getFna_delete() {
		return fna_delete;
	}
	public void setFna_delete(int fna_delete) {
		this.fna_delete = fna_delete;
	}
	public String getFna_date() {
		return fna_date;
	}
	public void setFna_date(String fna_date) {
		this.fna_date = fna_date;
	}
	
}
