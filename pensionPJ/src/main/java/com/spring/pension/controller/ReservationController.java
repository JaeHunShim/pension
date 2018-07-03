package com.spring.pension.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.CalendarUtile;
import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.PageMaker;
import com.spring.pension.domain.ReserVO;
import com.spring.pension.domain.ReservationVO;
import com.spring.pension.service.ReservationService;
import com.spring.pension.util.MakeExcel;


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
		model.addAttribute("reserVO",reserService.getReserNo());
		session.setAttribute("current", reserService.calenders(calender));
	}
	//캘린더 움직이는 부분 
	@RequestMapping(value="/calendar",method=RequestMethod.POST)
	public void moveCalendar(CalendarUtile calender,ReserVO reserVO,Model model) throws Exception {
		
		model.addAttribute("calender", reserService.moveCalenders(calender));
		model.addAttribute("reserVO",reserService.getReserNo());
	}
	//정보입력하는 부분
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public void infoInsert(CalendarUtile calender,ReservationVO reVO,HttpSession session,Model model) throws Exception {
		
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
	//예약 확인하는 부분 
	@RequestMapping(value="/confirm",method=RequestMethod.POST)
	public void reserConfirm(@ModelAttribute("calender") CalendarUtile calender,HttpSession session,Model model) throws Exception {
		
		model.addAttribute("reserVO",reserService.confirm(calender));
	
	}
	//예약 처리 하는 부분 
	@RequestMapping(value="/lastInsert",method =RequestMethod.POST )
	public String lastInsert(ReserVO reserVO,HttpSession session,String fullDate,String lastFullDate,Integer reserNo,Model model) throws Exception{
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fullDate);
		Date lastdate = new SimpleDateFormat("yyyy-MM-dd").parse(lastFullDate);
		reserVO.setR_fullDate(date);
		reserVO.setR_lastFullDate(lastdate);
		reserVO.setReserNo(reserNo);
		reserService.insertConfirm(reserVO);
		reserService.getReserNo();
		
		return "redirect:/reservation/reservation_main";
	}
	//1. 관리자가 예약현황 보기
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public void management(Model model) throws Exception {
		
		model.addAttribute("list",reserService.adminList());
		System.out.println("받아오는것들" + reserService.adminList().toString());
	}
	//2. 관리자가 예약현황 보기(페이징처리)
	@RequestMapping(value="/managementPaging",method=RequestMethod.GET)
	public void managementPaging(@ModelAttribute("cri")Criteria cri,Model model) throws Exception {
		
		model.addAttribute("list", reserService.managementList(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reserService.listCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	// 관리자가 예약정보 삭제하는 부분 
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(int reserNo,RedirectAttributes rttr) throws Exception {
		logger.info("관리자 페이지에서 삭제하기-------------------------------- ");
		logger.info("reserNo 정보:" + reserNo);
		reserService.delete(reserNo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/reservation/managementPaging";
	}
	// 입금현황 바꾸는 부분
	@RequestMapping(value="/modifyDeposit",method=RequestMethod.GET)
	public String modiDeposit(int reserNo)throws Exception {
		logger.info("입금현황 수정하기 -------------------------------------------");
		logger.info("reserNo정보:" + reserNo);
		reserService.modiDeposit(reserNo);
		
		return "redirect:/reservation/managementPaging";
	}
	// 예약현황 엑셀 파일로 저장
	@RequestMapping(value="/excel",method=RequestMethod.GET)
	public void downloadExel(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> map1 = new HashMap<String,Object>();
		List<Map<String,Object>> management = reserService.adminList();
		for(int i=0; i<management.size(); i++) {
			map = management.get(i);
			
			String aa = new SimpleDateFormat("yyyy-MM-dd").format(map.get("r_fullDate"));
			System.out.println("fullDate:" + map.get("r_fullDate"));
			map.put("aa", aa);
			System.out.println(aa);
			
			management.add(map);
		}
		/*map.put("management", management);*/
		System.out.println("management정보:" + management);
		MakeExcel exel = new MakeExcel();
		exel.download(request, response, map, "예약현황", "예약현황.xlsx", "있어도그만 없어도 그만");
	}
}
