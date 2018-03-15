package com.mbs.mvc.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class Main_SearchVO {
	private String category_food = null;
	private String category_travel = null;
	private String addr = null;
	private String date = null;
	private int price_start = 0;
	private int price_end = 0;
	public String getCategory_food() {
		return category_food;
	}
	public void setCategory_food(String category_food) {
		this.category_food = category_food;
	}
	public String getCategory_travel() {
		return category_travel;
	}
	public void setCategory_travel(String category_travel) {
		this.category_travel = category_travel;
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
