package com.spring.pension.domain;

import java.util.Date;

public class ReserDTO {

	private Integer reserNo;
	private String user_id; //예약id
	private String user_name; //예약 이름
	private String room_name; //방이름 
	private int total_pay;	//지불할금액
	private int inwon_check;	//예약인원
	private Date r_fullDate;	//예약날짜
	private Date r_lastFullDate;	// 예약한 날짜의 마지막 날짜
	private int reser_select;	// 1박, 2박, ....
	private String deposit; // 결제여부
    private String user_email; //이메일
    private String user_phone;
	
    public Integer getReserNo() {
		return reserNo;
	}
	public void setReserNo(Integer reserNo) {
		this.reserNo = reserNo;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}
	public int getInwon_check() {
		return inwon_check;
	}
	public void setInwon_check(int inwon_check) {
		this.inwon_check = inwon_check;
	}
	public Date getR_fullDate() {
		return r_fullDate;
	}
	public void setR_fullDate(Date r_fullDate) {
		this.r_fullDate = r_fullDate;
	}
	public Date getR_lastFullDate() {
		return r_lastFullDate;
	}
	public void setR_lastFullDate(Date r_lastFullDate) {
		this.r_lastFullDate = r_lastFullDate;
	}
	public int getReser_select() {
		return reser_select;
	}
	public void setReser_select(int reser_select) {
		this.reser_select = reser_select;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
    
    
}
