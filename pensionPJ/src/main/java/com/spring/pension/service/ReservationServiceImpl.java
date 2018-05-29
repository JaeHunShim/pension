package com.spring.pension.service;

import java.util.Calendar;

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
			calender.setDate(cal.get(cal.DAY_OF_MONTH));
			System.out.println(calender.toString());
			
		return calender;
	}
}
