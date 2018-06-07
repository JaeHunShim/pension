package com.spring.pension.service;

import com.spring.pension.util.CalendarUtile;

public interface ReservationService {
	
	// 달력 출력
	public CalendarUtile calenders(CalendarUtile calender) throws Exception;
	//달력 이동
	public CalendarUtile moveCalenders(CalendarUtile calender) throws Exception;
	// dNum 가지고 오기 
	public CalendarUtile getdNum(int dNum) throws Exception;
	// check 가지고 오는 부분 (라디오 버튼 체크 하기위해서 ...)
	public CalendarUtile getCheck(int room_check) throws Exception;
	
	public CalendarUtile changePay(CalendarUtile calender) throws Exception;
}
