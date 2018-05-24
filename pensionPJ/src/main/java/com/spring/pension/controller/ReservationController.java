package com.spring.pension.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value="/reservation_guide", method=RequestMethod.GET)
	public void guide() {
		
	}
	//에약 메인 페이지 불러오기
	@RequestMapping(value="/reservation_main",method =RequestMethod.GET)
	public void reservation_main() throws Exception {
		
	}
	//예약 메인 페이지안에  iframe 달력 불러옴
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public void calendar() throws Exception {
		
	}
	@RequestMapping(value="/select",method=RequestMethod.GET)
	public void select() throws Exception {
		
	}
}
