package com.spring.pension.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarUtile {
	
	private int inwon_check=4; //선택한 인원
	private int pay; //숙박에 따라서 바뀌는 돈 
	private Date fullDate; //년도 full(문자열을 Date로 합침)
	private int year; //년도
	private int month; //달력
	private int date; //현재 날짜
	private int week;	//주
	private int lastDate; //이달에 마지막 일자 
	private int row; //행의 갯수 
	private int dNum; // 선택한 달력의 날짜(일)
	private int room_check; // 선택한 룸
	private String room_name; //선택한 룸 이름
	private int select =1; //숙박날짜 (1~31) 초기값을 1박으로 잡아줌 
	private String room_width; //방크기에 대한 정보
	private int middle_pay;//숙박기간에 따른 지불할 금액 중간 집계가격
	private int add_pay; // 인원에 따른 추가 금액 
	private int total_pay;// 숙박기간 + 인원에 대한 금액
	
	
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int middle_pay,int add_pay) {

		this.total_pay = middle_pay+add_pay;
	}
	public int getAdd_pay() {
		return add_pay;
	}
	public void setAdd_pay(int inwon_check) {
		this.add_pay = (inwon_check-4)*20000;
	}
	public int getMiddle_pay() {
		return middle_pay;
	}
	public void setMiddle_pay(int middle_pay) {
		this.middle_pay = middle_pay;
	}
	public String getRoom_width() {
		return room_width;
	}
	public void setRoom_width(String room_width) {
		this.room_width = room_width;
	}
	public int getSelect() {
		return select;
	}
	public void setSelect(int select) {
		this.select = select;
	}
	public int getInwon_check() {
		return inwon_check;
	}
	public void setInwon_check(int inwon_check) {
		this.inwon_check = inwon_check;
	}
	public int getPay() {
		return pay;
	}
	//숙박에 따른 페이계산 
	public void setPay(int select) {
		this.pay = 120000*select;
	}
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
	/*@Override
	public String toString() {
		return "CalendarUtile [inwon_check=" + inwon_check + ", pay=" + pay + ", fullDate=" + fullDate + ", year="
				+ year + ", month=" + month + ", date=" + date + ", week=" + week + ", lastDate=" + lastDate + ", row="
				+ row + ", dNum=" + dNum + ", room_check=" + room_check + ", room_name=" + room_name + ", select="
				+ select + ", room_width=" + room_width + ", middle_pay=" + middle_pay + ", add_pay=" + add_pay
				+ ", total_pay=" + total_pay + ", getTotal_pay()=" + getTotal_pay() + ", getAdd_pay()=" + getAdd_pay()
				+ ", getMiddle_pay()=" + getMiddle_pay() + ", getRoom_width()=" + getRoom_width() + ", getSelect()="
				+ getSelect() + ", getInwon_check()=" + getInwon_check() + ", getPay()=" + getPay()
				+ ", getRoom_name()=" + getRoom_name() + ", getFullDate()=" + getFullDate() + ", getRoom_check()="
				+ getRoom_check() + ", getdNum()=" + getdNum() + ", getYear()=" + getYear() + ", getMonth()="
				+ getMonth() + ", getDate()=" + getDate() + ", getWeek()=" + getWeek() + ", getLastDate()="
				+ getLastDate() + ", getRow()=" + getRow() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}*/
	
}
