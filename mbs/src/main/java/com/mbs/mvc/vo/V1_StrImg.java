package com.mbs.mvc.vo;

public class V1_StrImg {
	private int str_img_no=0;
	private byte[] str_image = null;
	private String str_image_l = null;
	private int str_delete=1;
	private String str_date=null;
	private int str_number=0;
	
	
	public int getStr_img_no() {
		return str_img_no;
	}
	public String getStr_image_l() {
		return str_image_l;
	}
	public void setStr_image_l(String str_image_l) {
		this.str_image_l = str_image_l;
	}
	public void setStr_img_no(int str_img_no) {
		this.str_img_no = str_img_no;
	}
	public byte[] getStr_image() {
		return str_image;
	}
	public void setStr_image(byte[] str_image) {
		this.str_image = str_image;
	}
	public int getStr_delete() {
		return str_delete;
	}
	public void setStr_delete(int str_delete) {
		this.str_delete = str_delete;
	}
	public String getStr_date() {
		return str_date;
	}
	public void setStr_date(String str_date) {
		this.str_date = str_date;
	}
	public int getStr_number() {
		return str_number;
	}
	public void setStr_number(int str_number) {
		this.str_number = str_number;
	}
	
	
}
