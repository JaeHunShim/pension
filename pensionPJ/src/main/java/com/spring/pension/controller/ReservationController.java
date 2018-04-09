package com.spring.pension.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	
	private static final Logger  logger = LoggerFactory.getLogger(ReservationController.class);
	//예약 종압안내 페이지로 이동
	@RequestMapping(value="/resGuide",method=RequestMethod.GET)
	public String guide() {
		logger.info("에약 안내페이지로 이동---------------");
		return "/reservation/resGuide";
	}
	//실시간 예약 페이지로 이동
	@RequestMapping(value="/sub2",method=RequestMethod.GET)
	public String sub2() {
		logger.info("실시간 예약 현황 보기----------------");
		return "/reservation/sub2";
	}
	//예약현황 불러오기
	@RequestMapping(value="/reservation",method=RequestMethod.GET)
	public String reservation() {
		logger.info("");
		return "/reservation/reservation";
	}
}
