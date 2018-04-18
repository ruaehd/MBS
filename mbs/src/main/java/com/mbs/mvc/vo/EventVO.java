package com.mbs.mvc.vo;

public class EventVO {
	private int evt_no = 0;
	private String evt_title = null;
	private byte[] evt_content = null;
	private byte[] evt_image = null;
	private String evt_begintime = null;
	private String evt_endtime = null;
	private String evt_date = null;
	private String mb_id = null;
	private int evt_delete = 0;
	
	public int getEvt_delete() {
		return evt_delete;
	}
	public void setEvt_delete(int evt_delete) {
		this.evt_delete = evt_delete;
	}
	public int getEvt_no() {
		return evt_no;
	}
	public void setEvt_no(int evt_no) {
		this.evt_no = evt_no;
	}
	public String getEvt_title() {
		return evt_title;
	}
	public void setEvt_title(String evt_title) {
		this.evt_title = evt_title;
	}
	public byte[] getEvt_content() {
		return evt_content;
	}
	public void setEvt_content(byte[] evt_content) {
		this.evt_content = evt_content;
	}
	public byte[] getEvt_image() {
		return evt_image;
	}
	public void setEvt_image(byte[] evt_image) {
		this.evt_image = evt_image;
	}
	public String getEvt_begintime() {
		return evt_begintime;
	}
	public void setEvt_begintime(String evt_begintime) {
		this.evt_begintime = evt_begintime;
	}
	public String getEvt_endtime() {
		return evt_endtime;
	}
	public void setEvt_endtime(String evt_endtime) {
		this.evt_endtime = evt_endtime;
	}
	public String getEvt_date() {
		return evt_date;
	}
	public void setEvt_date(String evt_date) {
		this.evt_date = evt_date;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
}
