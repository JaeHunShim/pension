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
	
	@RequestMapping(value="/guide",method=RequestMethod.GET)
	public String resGuide() {
		logger.info("예약안내 페이지이동");
		 
		return "/reservation/resGuide";
	}
	@RequestMapping(value="/realRes",method=RequestMethod.GET)
	public String realRes() {
		logger.info("실시간 예약현황 보기");
		return "/reservation/real_reservation";
	}
	@RequestMapping(value="/reservation",method=RequestMethod.GET)
	public String reservation() {
		logger.info("예약현황 보기 2");
		return "/reservation/reservation";
	}
}
