package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main")
public class IndexController {

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String main() {
		
		return "/index";
	}
	@RequestMapping(value="/sub2",method=RequestMethod.GET)
	public String index() {
		
		return "/sub2";
	}
	@RequestMapping(value="/reservation",method=RequestMethod.GET)
	public String index2() {
		
		return "/reservation";
	}
	@RequestMapping(value="/resGuide",method=RequestMethod.GET)
	public String resGuide() {
		
		return "/resGuide";
	}
	@RequestMapping(value="/intro",method=RequestMethod.GET)
	public String intro() {
		
		return "intro";
	}
}
