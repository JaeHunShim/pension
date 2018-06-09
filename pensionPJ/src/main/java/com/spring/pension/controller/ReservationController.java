package com.spring.pension.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.pension.domain.ReservationVO;
import com.spring.pension.service.ReservationService;
import com.spring.pension.util.CalendarUtile;


@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	
	@Inject
	private ReservationService reserService;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value="/reservation_guide", method=RequestMethod.GET)
	public void guide() {
		
	}
	//에약 메인 페이지 불러오기
	@RequestMapping(value="/reservation_main",method =RequestMethod.GET)
	public void reservation_main() throws Exception {
		
	}
	//예약 메인 페이지안에  iframe 달력 불러옴
	/*@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public void calendar() throws Exception {
		
	}*/
	@RequestMapping(value="/select",method=RequestMethod.GET)
	public void select(@ModelAttribute("calender") CalendarUtile calender ,@RequestParam("dNum")int dNum,@RequestParam("room_check") int room_check, Model model) throws Exception {
		
		model.addAttribute("calender",reserService.moveCalenders(calender));
		model.addAttribute("date",reserService.getdNum(dNum));
		model.addAttribute("room_check",reserService.getCheck(room_check));
		
	}
	//현재 켈린더 가지고 오는 부분 
	@RequestMapping(value ="/calendar",method=RequestMethod.GET)
	public void calendar(CalendarUtile calender, Model model, HttpSession session) throws Exception {
		
		model.addAttribute("calender",reserService.calenders(calender));
		session.setAttribute("current", reserService.calenders(calender));
	}
	//캘린더 움직이는 부분 
	@RequestMapping(value="/calendar",method=RequestMethod.POST)
	public void moveCalendar(CalendarUtile calender, Model model) throws Exception {
		
		model.addAttribute("calender", reserService.moveCalenders(calender));
	}
	//정보입력하는 부분
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public void infoInsert(CalendarUtile calender,ReservationVO reVO ,Model model) throws Exception {
		
		model.addAttribute("calender",reserService.insert(calender));
	}
	//숙박에 따라서 가격바꾸는 부분 (ModelAndView 사용 )
	@RequestMapping(value="/pay",method=RequestMethod.POST)
	public ModelAndView payModify(CalendarUtile calender,ReservationVO reVO,Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/select");
		mav.addObject("calender",reserService.moveCalenders(calender));
		mav.addObject("calender", reserService.changePay(calender));
		mav.addObject("date",reserService.getdNum(calender.getdNum()));
		model.addAttribute("room_check",reserService.getCheck(calender.getRoom_check()));
	
		return mav;
	}
}
