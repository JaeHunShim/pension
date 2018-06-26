package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/admin/*")
@Controller
public class AdminController{
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list() throws Exception{
		
	}
}
