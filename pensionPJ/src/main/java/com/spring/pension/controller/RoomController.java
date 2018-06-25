package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//그냥 페이지만 이동하는 부분 
@RequestMapping("/room/*")
@Controller
public class RoomController {
	@RequestMapping(value="/lily",method=RequestMethod.GET)
	public void lily() throws Exception {
		
	}
	@RequestMapping(value="/daisy",method=RequestMethod.GET)
	public void daisy() throws Exception {
		
	}
	@RequestMapping(value="/ivy",method=RequestMethod.GET)
	public void ivy() throws Exception {
		
	}
	@RequestMapping(value="/margaret",method=RequestMethod.GET)
	public void margaret() throws Exception {
		
	}
}
