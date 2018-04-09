package com.mbs.mvc.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class Main_SearchVO {
	private int category = 0;
	private String addr = null;
	private String date = null;
	private int price_start = 0;
	private int price_end = 0;
	private int range = 0;
	private String lat = null;
	private String lng = null;
	private String so = null;
	private String we = null;
	private String no = null;
	private String ea = null;
	
	
	
	public String getSo() {
		return so;
	}
	public void setSo(String so) {
		this.so = so;
	}
	public String getWe() {
		return we;
	}
	public void setWe(String we) {
		this.we = we;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getEa() {
		return ea;
	}
	public void setEa(String ea) {
		this.ea = ea;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPrice_start() {
		return price_start;
	}
	public void setPrice_start(int price_start) {
		this.price_start = price_start;
	}
	public int getPrice_end() {
		return price_end;
	}
	public void setPrice_end(int price_end) {
		this.price_end = price_end;
	}
	
}
