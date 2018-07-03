package com.spring.pension.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.spring.pension.domain.CalendarUtile;
import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReserVO;
import com.spring.pension.persistence.ReserDAO;
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	private ReserDAO reserDAO;
	
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
			calender.setFullDate(calender.getYear(), calender.getMonth(), calender.getdNum());
			calender.setPay(1);//처음 1박2일에 대한 가격 처리 
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
	//숙박에 따른 값 변동
	@Override
	public CalendarUtile changePay(CalendarUtile calender) throws Exception {
		
		calender.setPay(calender.getSelect());
		
		return calender;
	}
	//숙박에 관한 세부정보 입력
	@Override
	public CalendarUtile insert(CalendarUtile calender) throws Exception {
		
		calender.setRoom_max(calender.getRoom_max());
		calender.setRoom_name(calender.getRoom_name());
		calender.setRoom_width(calender.getRoom_width());
		calender.setInwon_check(calender.getInwon_check());
		calender.setMiddle_pay(calender.getMiddle_pay());
		calender.setAdd_pay(calender.getInwon_check());
		calender.setTotal_pay(calender.getMiddle_pay(), calender.getAdd_pay());
		calender.setFullDate(calender.getYear(), calender.getMonth(), calender.getdNum());
		calender.setLastFullDate(calender.getFullDate(), calender.getSelect());
		
		
		return calender;
	}
	@Override
	public ReserVO confirm(CalendarUtile calender)throws Exception {
		calender.setRoom_max(calender.getRoom_max());
		calender.setRoom_name(calender.getRoom_name());
		calender.setRoom_width(calender.getRoom_width());
		calender.setInwon_check(calender.getInwon_check());
		calender.setMiddle_pay(calender.getMiddle_pay());
		calender.setAdd_pay(calender.getInwon_check());
		calender.setTotal_pay(calender.getMiddle_pay(), calender.getAdd_pay());
		calender.setFullDate(calender.getYear(), calender.getMonth(), calender.getdNum());
		calender.setLastFullDate(calender.getFullDate(), calender.getSelect());
		calender.setEntance_time(calender.getEntance_time());
		calender.setReser_content(calender.getReser_content());
		
		
		ReserVO reserVO = new ReserVO();
		reserVO.setR_fullDate(calender.getFullDate());
		reserVO.setInwon_check(calender.getInwon_check());
		reserVO.setR_lastFullDate(calender.getLastFullDate());
		reserVO.setRoom_name(calender.getRoom_name());
		reserVO.setReser_select(calender.getSelect());
		reserVO.setTotal_pay(calender.getTotal_pay());
		reserVO.setEntance_time(calender.getEntance_time());
		reserVO.setReser_content(calender.getReser_content());
		
		return reserVO;
	}
	//에약 정보 넣기 
	@Override
	public void insertConfirm(ReserVO reserVO) throws Exception {
		
		reserDAO.insert(reserVO);
	}
	//예약 번호 받아오는 부분
	@Override
	public List<ReserVO> getReserNo() throws Exception {
		
		return reserDAO.getReserNo();
	}
	//1. 관리자가볼 예약 정보 가지고오기
	@Override
	public List<Map<String, Object>> adminList() throws Exception {
		
		System.out.println(reserDAO.admin());
		Map<String,String> map = new HashMap<String,String>();
		
		return reserDAO.admin();
	}
	//예약정보 데이터 갯수 가지고 오기 (페이징 처리)
	@Override
	public int listCount(Criteria cri) throws Exception {
		
		return reserDAO.conutPage(cri);
	}
	//2. 관리자가볼 예약정보 가지고 오기(페이징 처리)
	@Override
	public List<Map<String, Object>> managementList(Criteria cri) throws Exception {
		
		return reserDAO.management(cri);
	}
	//관리자가 게시물 삭제
	@Override
	public void delete(int reserNo) throws Exception {
		
		reserDAO.delete(reserNo);
	}
	//관리자 게시물 수정(입금완료,입금전)
	@Override
	public void modiDeposit(int reserNo) throws Exception {
		
		reserDAO.modiDeposit(reserNo);
	}
	
}
