package com.spring.pension.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SocketController {
	
	@RequestMapping(value="/socket",method=RequestMethod.GET)
	public ModelAndView socket(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("login", session.getAttribute("login"));
		mav.setViewName("socket/socket");
		return mav;
	}
}
