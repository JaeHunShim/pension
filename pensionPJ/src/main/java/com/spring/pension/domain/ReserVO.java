package com.spring.pension.domain;

import java.util.Date;

public class ReserVO {
	
	private String user_id; //예약id
	private String room_name; //방이름
	private int inwon_check;	//예약인원
	private int total_pay;	//지불할금액
	private Date fullDate;	//예약날짜
	private Date lastFullDate;	// 예약한 날짜의 마지막 날짜
	private int reser_select;	// 1박, 2박, ....
	private String entance_time;	// 입실예정시간
	private String reser_content;	//전달사항
	private String payment;	//결제수단 
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
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
	public int getReser_select() {
		return reser_select;
	}
	public void setReser_select(int reser_select) {
		this.reser_select = reser_select;
	}
	public String getEntance_time() {
		return entance_time;
	}
	public void setEntance_time(String entance_time) {
		this.entance_time = entance_time;
	}
	public String getReser_content() {
		return reser_content;
	}
	public void setReser_content(String reser_content) {
		this.reser_content = reser_content;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "ReserVO [room_name=" + room_name + ", inwon_check=" + inwon_check + ", total_pay=" + total_pay
				+ ", fullDate=" + fullDate + ", lastFullDate=" + lastFullDate + ", reser_select=" + reser_select
				+ ", entance_time=" + entance_time + ", reser_content=" + reser_content + ", payment=" + payment
				+ ", getRoom_name()=" + getRoom_name() + ", getInwon_check()=" + getInwon_check() + ", getTotal_pay()="
				+ getTotal_pay() + ", getFullDate()=" + getFullDate() + ", getLastFullDate()=" + getLastFullDate()
				+ ", getReser_select()=" + getReser_select() + ", getEntance_time()=" + getEntance_time()
				+ ", getReser_content()=" + getReser_content() + ", getPayment()=" + getPayment() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
