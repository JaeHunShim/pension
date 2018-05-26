package com.spring.pension.util;

import java.util.Calendar;
import java.util.Date;

public class CalendarUtile {
	
	private int year =0; //년도
	private int month=0; //달력
	private int date=0; //날짜
	private int week;	//주

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
	
	
}
