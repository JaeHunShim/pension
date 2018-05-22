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
	
	@RequestMapping(value="/listskin",method=RequestMethod.GET)
	public void listSkin() throws Exception {
		
	}
	@RequestMapping(value="/calendar_skin",method=RequestMethod.GET)
	public void calendarSkin() throws Exception {
		
	}
	@RequestMapping(value="/view_skin" ,method=RequestMethod.GET)
	public void view_skin() throws Exception {
		
	}
	@RequestMapping(value="/write_skin",method=RequestMethod.GET)
	public void writeSkin() throws Exception {
		
	}
	
}
