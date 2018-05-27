package com.spring.pension.util;

import java.util.Calendar;
import java.util.Date;

public class CalendarUtile {
	
	private int year; //년도
	private int month; //달력
	private int date; //날짜
	private int week;	//주
	private int lastDate; //이달에 마지막 일자 
	
	private Calendar calender = Calendar.getInstance();
	
	
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {

		this.year = calender.get(Calendar.YEAR);
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {

		this.month = calender.get(Calendar.MONTH);
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {

		this.date = calender.get(Calendar.DAY_OF_MONTH);
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = calender.get(Calendar.DAY_OF_WEEK);
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
	
}
