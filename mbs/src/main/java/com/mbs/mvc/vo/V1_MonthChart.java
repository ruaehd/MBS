package com.mbs.mvc.vo;

public class V1_MonthChart {
	private String member = null, store = null,reservation = null;
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	private int count = 0;
	
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
