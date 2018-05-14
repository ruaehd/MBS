package com.mbs.mvc.vo;

public class V1_Admin_SearchVO {

	private int page = 0 , searchcol = 0 , gubun = 0;
	public int getGubun() {
		return gubun;
	}
	public void setGubun(int gubun) {
		this.gubun = gubun;
	}
	private String searchval = null,cort = null;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSearchcol() {
		return searchcol;
	}
	public void setSearchcol(int searchcol) {
		this.searchcol = searchcol;
	}
	public String getSearchval() {
		return searchval;
	}
	public void setSearchval(String searchval) {
		this.searchval = searchval;
	}
	public String getCort() {
		return cort;
	}
	public void setCort(String cort) {
		this.cort = cort;
	}
	
	
}
