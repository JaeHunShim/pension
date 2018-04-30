package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/upload/*")
public class FileUploadController {
	
	@RequestMapping(value="/photo_uploader" ,method=RequestMethod.POST)
	public void fileUploadPage() throws Exception{
		
	}
}
