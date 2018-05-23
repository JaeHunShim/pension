package com.spring.pension.domain;

import java.util.Date;

public class ReservationVO {
	
	private Integer room_select; //선택된 룸 
	private String room_possible; //예약 가능과 가능하지 않은것
	private String room_name;	// 방이름
	private String room_size;	//방 사이즈
	private Integer room_max;	//방 최소/최대인원
	private Integer room_person;	//인원 선택
	private Integer room_price;	// 방 가격
	private Date room_date;	//예약 날짜 
	
	public Integer getRoom_select() {
		return room_select;
	}
	public void setRoom_select(Integer room_select) {
		this.room_select = room_select;
	}
	public String getRoom_possible() {
		return room_possible;
	}
	public void setRoom_possible(String room_possible) {
		this.room_possible = room_possible;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_size() {
		return room_size;
	}
	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}
	public Integer getRoom_max() {
		return room_max;
	}
	public void setRoom_max(Integer room_max) {
		this.room_max = room_max;
	}
	public Integer getRoom_person() {
		return room_person;
	}
	public void setRoom_person(Integer room_person) {
		this.room_person = room_person;
	}
	public Integer getRoom_price() {
		return room_price;
	}
	public void setRoom_price(Integer room_price) {
		this.room_price = room_price;
	}
	public Date getRoom_date() {
		return room_date;
	}
	public void setRoom_date(Date room_date) {
		this.room_date = room_date;
	}
	@Override
	public String toString() {
		return "ReservationVO [room_select=" + room_select + ", room_possible=" + room_possible + ", room_name="
				+ room_name + ", room_size=" + room_size + ", room_max=" + room_max + ", room_person=" + room_person
				+ ", room_price=" + room_price + ", room_date=" + room_date + ", getRoom_select()=" + getRoom_select()
				+ ", getRoom_possible()=" + getRoom_possible() + ", getRoom_name()=" + getRoom_name()
				+ ", getRoom_size()=" + getRoom_size() + ", getRoom_max()=" + getRoom_max() + ", getRoom_person()="
				+ getRoom_person() + ", getRoom_price()=" + getRoom_price() + ", getRoom_date()=" + getRoom_date()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
