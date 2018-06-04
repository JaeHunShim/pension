package com.spring.pension.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarUtile {
	
	private Date fullDate; //년도 full(문자열을 Date로 합침)
	private int year; //년도
	private int month; //달력
	private int date; //현재 날짜
	private int week;	//주
	private int lastDate; //이달에 마지막 일자 
	private int row; //행의 갯수 
	private int dNum; // 선택한 달력의 날짜
	private int room_check; // 선택한 룸
	private String room_name; //선택한 룸 이름
	
	
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public Date getFullDate() {
		return fullDate;
	}
	// 파라미터로 년도,월,일을 문자열로 합친후 date형식으로 바꿈 
	public void setFullDate(int year, int month,int dNum) throws ParseException {
		
		String strd = year+"-"+month+"-"+dNum;
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(strd);
		
		this.fullDate = date;
	}

	public int getRoom_check() {
		return room_check;
	}

	public void setRoom_check(int room_check) {
		this.room_check = room_check;
	}

	public int getdNum() {
		return dNum;
	}

	public void setdNum(int dNum) {
		this.dNum = dNum;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {

		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {

		this.month = month;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {

		this.date = date;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int year, int month) {
		Calendar cal = Calendar.getInstance();
		
		cal.set(year,month,1);
		
		this.week = cal.get(Calendar.DAY_OF_WEEK);
	}

	//마지막 날짜 구하는 함수 
	public void setLastDate(int year) {
		
		int lastarr[] = {31,28,31,30,31,30,31,31,30,31,30,31};
		
		//윤년 구하는 곳
		if(year%4 !=0 && year%100 !=0 || year%400 ==0) {
			
			lastarr[1]=29;
		}else {
			lastarr[1]=28;
		}
		this.lastDate = lastarr[month];
	}
	public int getLastDate() {
		
		return lastDate;
	}
	//필요한 행 구하기 
	public void setRow(int week,int lastDate) {

		this.row =(int)Math.ceil(((double)week+(double)lastDate)/7);
	}
	public int getRow() {
		
		return row;
	}
	
	@Override
	public String toString() {
		return "CalendarUtile [fullDate=" + fullDate + ", year=" + year + ", month=" + month + ", date=" + date
				+ ", week=" + week + ", lastDate=" + lastDate + ", row=" + row + ", dNum=" + dNum + ", room_check="
				+ room_check + ", room_name=" + room_name + ", getRoom_name()=" + getRoom_name() + ", getFullDate()="
				+ getFullDate() + ", getRoom_check()=" + getRoom_check() + ", getdNum()=" + getdNum() + ", getYear()="
				+ getYear() + ", getMonth()=" + getMonth() + ", getDate()=" + getDate() + ", getWeek()=" + getWeek()
				+ ", getLastDate()=" + getLastDate() + ", getRow()=" + getRow() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
