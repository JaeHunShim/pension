package com.spring.pension.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.pension.domain.CalendarUtile;
import com.spring.pension.domain.Criteria;
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
	// 예약 마지막 확인하는 부분  
	public ReserVO confirm(CalendarUtile calender) throws Exception;
	// 예약정보 삽입
	public void insertConfirm(ReserVO reserVO) throws Exception;
	// 예약정보 가지고오기 
	public List<ReserVO> getReserNo() throws Exception;
	//1. 관리자가볼 예약정보 가지고오기
	public List<Map<String,Object>> adminList() throws Exception;
	// 예약정보 데이터 갯수 가지고 오기
	public int listCount(Criteria cri) throws Exception;
	//2. 관리자가볼 예약정보 가지고오기(페이징처리)
	public List<Map<String,Object>> managementList(Criteria cri) throws Exception;
}
