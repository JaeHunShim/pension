package com.spring.pension.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.spring.pension.util.CalendarUtile;
@Service
public class ReservationServiceImpl implements ReservationService {
		
	private static final  Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);
	// 금일 달력 출력
	@Override
	public CalendarUtile calenders(CalendarUtile calender) throws Exception {
			
		Calendar cal = Calendar.getInstance();
			calender.setYear(cal.get(cal.YEAR));
			calender.setMonth(cal.get(cal.MONTH));
			calender.setDate(cal.get(cal.DAY_OF_MONTH));
			calender.setWeek(cal.get(cal.YEAR),cal.get(cal.MONTH));
			calender.setLastDate(cal.get(cal.YEAR));
			calender.setRow(calender.getWeek(),calender.getLastDate());
			
		return calender;
	}
	//날짜 이동
	@Override 
	public CalendarUtile moveCalenders(CalendarUtile calender) throws Exception {
			
			Calendar cal = Calendar.getInstance();
			
			calender.setYear(calender.getYear());
			calender.setMonth(calender.getMonth());
			calender.setWeek(calender.getYear(),calender.getMonth());
			calender.setRow(calender.getWeek(),calender.getLastDate());
			calender.setLastDate(calender.getYear());
			calender.setDate(calender.getDate());
			
			
			String strDate = calender.getYear()+"-"+ calender.getMonth()+"-"+calender.getdNum();
			System.out.println(strDate);
			
		return calender;
	}
	// 선택한 일자 가지고 오기 
	@Override
	public CalendarUtile getdNum(int dNum) throws Exception {
		CalendarUtile calender = new CalendarUtile();
		calender.setdNum(dNum);
		
		return calender;
	}
	//check 번호 받아오기
	@Override
	public CalendarUtile getCheck(int room_check) throws Exception {
		CalendarUtile calender = new CalendarUtile();
		
		calender.setRoom_check(room_check);
		
		return calender;
	}
}
