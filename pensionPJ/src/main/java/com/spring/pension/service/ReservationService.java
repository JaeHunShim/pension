package com.spring.pension.service;

import com.spring.pension.util.CalendarUtile;

public interface ReservationService {
	
	// 달력 출력
	public CalendarUtile calenders(CalendarUtile calender) throws Exception;
	//달력 이동
	public CalendarUtile moveCalenders(CalendarUtile calender) throws Exception;

}
