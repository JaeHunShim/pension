package com.spring.pension.controller;

import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pension.service.ReservationService;
import com.spring.pension.util.CalendarUtile;


@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	
	@Inject
	private ReservationService reserService;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value="/reservation_guide", method=RequestMethod.GET)
	public void guide() {
		
	}
	//에약 메인 페이지 불러오기
	@RequestMapping(value="/reservation_main",method =RequestMethod.GET)
	public void reservation_main() throws Exception {
		
	}
	//예약 메인 페이지안에  iframe 달력 불러옴
	/*@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public void calendar() throws Exception {
		
	}*/
	@RequestMapping(value="/select",method=RequestMethod.GET)
	public void select() throws Exception {
		
	}
	//현재 켈린더 가지고 오는 부분 
	@RequestMapping(value ="/calendar",method=RequestMethod.GET)
	public void calendar(CalendarUtile calender, Model model, HttpSession session) throws Exception {
		
		model.addAttribute("calender",reserService.calenders(calender));
		session.setAttribute("current", reserService.calenders(calender));
	}
	//캘린더 움직이는 부분 
	@RequestMapping(value="/calendar",method=RequestMethod.POST)
	public void moveCalendar(CalendarUtile calender, Model model) throws Exception {
		
		model.addAttribute("calender", reserService.moveCalenders(calender));
	}
}
