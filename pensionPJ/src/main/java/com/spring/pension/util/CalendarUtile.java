package com.spring.pension.util;

import java.util.Calendar;
import java.util.Date;

public class CalendarUtile {
	
	private int year; //년도
	private int month; //달력
	private int date; //현재 날짜
	private int week;	//주
	private int lastDate; //이달에 마지막 일자 
	private int row; //행의 갯수 
	
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
		return "CalendarUtile [year=" + year + ", month=" + month + ", date=" + date + ", week=" + week + ", lastDate="
				+ lastDate + ", row=" + row + ", getYear()=" + getYear() + ", getMonth()=" + getMonth() + ", getDate()="
				+ getDate() + ", getWeek()=" + getWeek() + ", getLastDate()=" + getLastDate() + ", getRow()=" + getRow()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
