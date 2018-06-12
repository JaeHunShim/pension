package com.spring.pension.domain;

import java.util.Date;

public class ReserVO {

	private String room_name;
	private int inwon_check;
	private int total_pay;
	private Date fullDate;
	private Date lastFullDate;
	private int select;
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getInwon_check() {
		return inwon_check;
	}
	public void setInwon_check(int inwon_check) {
		this.inwon_check = inwon_check;
	}
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}
	public Date getFullDate() {
		return fullDate;
	}
	public void setFullDate(Date fullDate) {
		this.fullDate = fullDate;
	}
	public Date getLastFullDate() {
		return lastFullDate;
	}
	public void setLastFullDate(Date lastFullDate) {
		this.lastFullDate = lastFullDate;
	}
	public int getSelect() {
		return select;
	}
	public void setSelect(int select) {
		this.select = select;
	}
	@Override
	public String toString() {
		return "ReserVO [room_name=" + room_name + ", inwon_check=" + inwon_check + ", total_pay=" + total_pay
				+ ", fullDate=" + fullDate + ", lastFullDate=" + lastFullDate + ", select=" + select
				+ ", getRoom_name()=" + getRoom_name() + ", getInwon_check()=" + getInwon_check() + ", getTotal_pay()="
				+ getTotal_pay() + ", getFullDate()=" + getFullDate() + ", getLastFullDate()=" + getLastFullDate()
				+ ", getSelect()=" + getSelect() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
		
	
}
