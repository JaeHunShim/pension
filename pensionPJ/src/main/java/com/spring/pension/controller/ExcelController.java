package com.spring.pension.controller;

import java.net.URLEncoder;
import java.text.FieldPosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.pension.domain.ReserDTO;
import com.spring.pension.service.ExcelService;

@Controller
public class ExcelController {

	@Inject
	private ExcelService excelService;
	
	private static final Logger logger= LoggerFactory.getLogger(ExcelController.class);
	
	@RequestMapping("/excel")
	public ModelAndView excelDownload(Map<String,Object> ModelMap,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String target = getNowYMD();
		String docName= URLEncoder.encode(target,"UTF-8");
		
		response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xlsx");
        // 엑셀파일명 한글깨짐 조치
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
		
        List<ReserDTO> excellist = excelService.getAllObjects();
        
        System.out.println("excelist정보 :" + excellist);
        mav.addObject("excellist", excellist);
        mav.setViewName("excelView");
        
        return mav;
	}
	private String getNowYMD() {
        StringBuffer dateResult = new StringBuffer();
        Date date = new Date();
        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
        simpleDate.format(date, dateResult, new FieldPosition(1));
        return dateResult.toString();
    }
}
