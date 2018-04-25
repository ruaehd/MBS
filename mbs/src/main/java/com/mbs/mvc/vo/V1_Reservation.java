package com.mbs.mvc.vo;

import java.util.List;

public class V1_Reservation {
	private int rsv_no = 0;
	private String rsv_day = null;
	private String rsv_time = null;
	private String rsv_personnel = null;
	private String rsv_sub_id = null;
	private String rsv_sub_name = null;
	private String rsv_sub_tel = null;
	private String rsv_sub_email = null;
	private String rsv_sub_request = null;
	private int str_number = 0;
	private int rsv_delete = 0;
	private String rsv_date = null;
	private int rsv_code = 1;
	private String rsv_day1 = null;
	
	private String str_name = null;
	private String str_tel = null;
	private String str_address = null;
	private int str_table = 0;
	private String mb_id = null;
	private String str_begintime = null;
	private String str_endtime = null;
	
	private String rsv_code_chk = null;
	private String rsv_code_date = null;
	
	private int str_personnel = 0;
	
	private List<V1_RsvMenu> rmlist = null;
	
	private int page = 0;
	
	private String type = null;
	private String text = null;
	
	private int exp = 0;
	private int com = 0;
	private int can = 0;
	
	
	
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getStr_personnel() {
		return str_personnel;
	}

	public void setStr_personnel(int str_personnel) {
		this.str_personnel = str_personnel;
	}

	public String getRsv_day1() {
		return rsv_day1;
	}

	public void setRsv_day1(String rsv_day1) {
		this.rsv_day1 = rsv_day1;
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public List<V1_RsvMenu> getRmlist() {
		return rmlist;
	}

	public void setRmlist(List<V1_RsvMenu> rmlist) {
		this.rmlist = rmlist;
	}

	public int getRsv_no() {
		return rsv_no;
	}

	public void setRsv_no(int rsv_no) {
		this.rsv_no = rsv_no;
	}

	public String getRsv_day() {
		return rsv_day;
	}

	public void setRsv_day(String rsv_day) {
		this.rsv_day = rsv_day;
	}

	public String getRsv_time() {
		return rsv_time;
	}

	public void setRsv_time(String rsv_time) {
		this.rsv_time = rsv_time;
	}

	public String getRsv_personnel() {
		return rsv_personnel;
	}

	public void setRsv_personnel(String rsv_personnel) {
		this.rsv_personnel = rsv_personnel;
	}

	public String getRsv_sub_id() {
		return rsv_sub_id;
	}

	public void setRsv_sub_id(String rsv_sub_id) {
		this.rsv_sub_id = rsv_sub_id;
	}

	public String getRsv_sub_name() {
		return rsv_sub_name;
	}

	public void setRsv_sub_name(String rsv_sub_name) {
		this.rsv_sub_name = rsv_sub_name;
	}

	public String getRsv_sub_tel() {
		return rsv_sub_tel;
	}

	public void setRsv_sub_tel(String rsv_sub_tel) {
		this.rsv_sub_tel = rsv_sub_tel;
	}

	public String getRsv_sub_email() {
		return rsv_sub_email;
	}

	public void setRsv_sub_email(String rsv_sub_email) {
		this.rsv_sub_email = rsv_sub_email;
	}

	public String getRsv_sub_request() {
		return rsv_sub_request;
	}

	public void setRsv_sub_request(String rsv_sub_request) {
		this.rsv_sub_request = rsv_sub_request;
	}

	public int getStr_number() {
		return str_number;
	}

	public void setStr_number(int str_number) {
		this.str_number = str_number;
	}

	public int getRsv_delete() {
		return rsv_delete;
	}

	public void setRsv_delete(int rsv_delete) {
		this.rsv_delete = rsv_delete;
	}

	public String getRsv_date() {
		return rsv_date;
	}

	public void setRsv_date(String rsv_date) {
		this.rsv_date = rsv_date;
	}

	public int getRsv_code() {
		return rsv_code;
	}

	public void setRsv_code(int rsv_code) {
		this.rsv_code = rsv_code;
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

	public String getStr_address() {
		return str_address;
	}

	public void setStr_address(String str_address) {
		this.str_address = str_address;
	}

	public int getStr_table() {
		return str_table;
	}

	public void setStr_table(int str_table) {
		this.str_table = str_table;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getRsv_code_chk() {
		return rsv_code_chk;
	}

	public void setRsv_code_chk(String rsv_code_chk) {
		this.rsv_code_chk = rsv_code_chk;
	}

	public String getRsv_code_date() {
		return rsv_code_date;
	}

	public void setRsv_code_date(String rsv_code_date) {
		this.rsv_code_date = rsv_code_date;
	}
	
}
