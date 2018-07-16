package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SocketController {
	
	@RequestMapping(value="/socket",method=RequestMethod.GET)
	public String socket() throws Exception {
		
		return "socket/socket";
	}
}
