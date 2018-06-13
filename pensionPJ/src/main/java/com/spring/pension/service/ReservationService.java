package com.spring.pension.service;

import com.spring.pension.domain.CalendarUtile;
import com.spring.pension.domain.ReserVO;

public interface ReservationService {
	
	// 달력 출력
	public CalendarUtile calenders(CalendarUtile calender) throws Exception;
	//달력 이동
	public CalendarUtile moveCalenders(CalendarUtile calender) throws Exception;
	// dNum 가지고 오기 
	public CalendarUtile getdNum(int dNum) throws Exception;
	// check 가지고 오는 부분 (라디오 버튼 체크 하기위해서 ...)
	public CalendarUtile getCheck(int room_check) throws Exception;
	// 숙박에 따른 가격변동하는 부분 
	public CalendarUtile changePay(CalendarUtile calender) throws Exception;
	// 예약에 대한 정보 입력 
	public CalendarUtile insert(CalendarUtile calender) throws Exception;

}
