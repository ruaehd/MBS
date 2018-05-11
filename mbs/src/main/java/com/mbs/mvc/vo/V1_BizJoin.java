package com.mbs.mvc.vo;

public class V1_BizJoin {
	private String company_name = null,
			company_class = null,
			company_num = null,
			ceo_name = null,
			company_conditions = null,
			company_event = null,
			company_tel = null,
			company_add = null,
			stime = null,
			etime = null,
			rsv_mn_name = null,
			rsv_mn_price = null,
			company_lng = null,
			company_lat = null,
			menu_name = null,
			filename = null,
			str_document = null;
	
	private byte[] file = null,
			imgs = null;
	private int str_img_idx = 0,
			company_personnel = 0,
			menu_price = 0,
			menu_idx = 0;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getMenu_idx() {
		return menu_idx;
	}
	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getCompany_lng() {
		return company_lng;
	}
	public void setCompany_lng(String company_lng) {
		this.company_lng = company_lng;
	}
	public String getCompany_lat() {
		return company_lat;
	}
	public void setCompany_lat(String company_lat) {
		this.company_lat = company_lat;
	}
	public int getCompany_personnel() {
		return company_personnel;
	}
	public void setCompany_personnel(int company_personnel) {
		this.company_personnel = company_personnel;
	}
	public int getStr_img_idx() {
		return str_img_idx;
	}
	public void setStr_img_idx(int str_img_idx) {
		this.str_img_idx = str_img_idx;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getRsv_mn_name() {
		return rsv_mn_name;
	}
	public void setRsv_mn_name(String rsv_mn_name) {
		this.rsv_mn_name = rsv_mn_name;
	}
	public String getRsv_mn_price() {
		return rsv_mn_price;
	}
	public void setRsv_mn_price(String rsv_mn_price) {
		this.rsv_mn_price = rsv_mn_price;
	}
	public String getCompany_class() {
		return company_class;
	}
	public String getStr_document() {
		return str_document;
	}
	public void setStr_document(String str_document) {
		this.str_document = str_document;
	}
	public void setCompany_class(String company_class) {
		this.company_class = company_class;
	}
	public String getCompany_num() {
		return company_num;
	}
	public void setCompany_num(String company_num) {
		this.company_num = company_num;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getCompany_conditions() {
		return company_conditions;
	}
	public void setCompany_conditions(String company_conditions) {
		this.company_conditions = company_conditions;
	}
	public String getCompany_event() {
		return company_event;
	}
	public void setCompany_event(String company_event) {
		this.company_event = company_event;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	public String getCompany_add() {
		return company_add;
	}
	public void setCompany_add(String company_add) {
		this.company_add = company_add;
	}
	public byte[] getFile() {
		return file;
	}
	public void setFile(byte[] file) {
		this.file = file;
	}
	public byte[] getImgs() {
		return imgs;
	}
	public void setImgs(byte[] imgs) {
		this.imgs = imgs;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	
}
