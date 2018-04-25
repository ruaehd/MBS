package com.mbs.mvc.vo;

import java.util.List;

public class V1_Store {
	private int str_number = 0;
	private String str_name = null;
	private String str_tel = null;
	private String str_address = null;
	private byte[] str_file = null;
	private String str_begintime = null;
	private String str_endtime = null;
	private int str_table = 0;
	private int str_delete = 1;
	private String str_date = null;
	private String str_rg_code = null;
	private String mb_id = null;
	private String str_ctgy_code = null;
	
	private int rsv_cmt_no = 0;
	private String rsv_cmt_content = null;
	private int rsv_cmt_point = 0;
	private int rsv_cmt_delete = 0;
	private String rsv_cmt_date = null;
	
	private int str_personnel = 0;
	
	private int page = 0;
	private int exp = 0;
	private int com = 0;
	private int can = 0;
	private int cnt = 0;
	private double avg = 0;
	private String mb_email = null;
	
	private String text = null;
	
	
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public int getCom() {
		return com;
	}
	public void setCom(int com) {
		this.com = com;
	}
	public int getCan() {
		return can;
	}
	public void setCan(int can) {
		this.can = can;
	}
	public int getStr_personnel() {
		return str_personnel;
	}
	public void setStr_personnel(int str_personnel) {
		this.str_personnel = str_personnel;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRsv_cmt_no() {
		return rsv_cmt_no;
	}
	public void setRsv_cmt_no(int rsv_cmt_no) {
		this.rsv_cmt_no = rsv_cmt_no;
	}
	public String getRsv_cmt_content() {
		return rsv_cmt_content;
	}
	public void setRsv_cmt_content(String rsv_cmt_content) {
		this.rsv_cmt_content = rsv_cmt_content;
	}
	public int getRsv_cmt_point() {
		return rsv_cmt_point;
	}
	public void setRsv_cmt_point(int rsv_cmt_point) {
		this.rsv_cmt_point = rsv_cmt_point;
	}
	public int getRsv_cmt_delete() {
		return rsv_cmt_delete;
	}
	public void setRsv_cmt_delete(int rsv_cmt_delete) {
		this.rsv_cmt_delete = rsv_cmt_delete;
	}
	public String getRsv_cmt_date() {
		return rsv_cmt_date;
	}
	public void setRsv_cmt_date(String rsv_cmt_date) {
		this.rsv_cmt_date = rsv_cmt_date;
	}
	public String getStr_address() {
		return str_address;
	}
	public void setStr_address(String str_address) {
		this.str_address = str_address;
	}
	public int getStr_number() {
		return str_number;
	}
	public void setStr_number(int str_number) {
		this.str_number = str_number;
	}
	public String getStr_name() {
		return str_name;
	}
	public void setStr_name(String str_name) {
		this.str_name = str_name;
	}
	public String getStr_tel() {
		return str_tel;
	}
	public void setStr_tel(String str_tel) {
		this.str_tel = str_tel;
	}
	public byte[] getStr_file() {
		return str_file;
	}
	public void setStr_file(byte[] str_file) {
		this.str_file = str_file;
	}
	public String getStr_begintime() {
		return str_begintime;
	}
	public void setStr_begintime(String str_begintime) {
		this.str_begintime = str_begintime;
	}
	public String getStr_endtime() {
		return str_endtime;
	}
	public void setStr_endtime(String str_endtime) {
		this.str_endtime = str_endtime;
	}
	public int getStr_table() {
		return str_table;
	}
	public void setStr_table(int str_table) {
		this.str_table = str_table;
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
	public String getStr_rg_code() {
		return str_rg_code;
	}
	public void setStr_rg_code(String str_rg_code) {
		this.str_rg_code = str_rg_code;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getStr_ctgy_code() {
		return str_ctgy_code;
	}
	public void setStr_ctgy_code(String str_ctgy_code) {
		this.str_ctgy_code = str_ctgy_code;
	}
	
	
}
