package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main/*")
public class IndexController {
	//메인 페이지로 이동
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String main() {
		
		return "index";
	}
	@RequestMapping(value="/intro", method=RequestMethod.GET)
	public String intro() {
		
		return "intro";
	}
}
