package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main")
public class IndexController {

	@RequestMapping(value="/sub2", method=RequestMethod.GET)
	public String main() {
		
		return "/sub2";
	}
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index() {
		
		return "/index";
	}
}
